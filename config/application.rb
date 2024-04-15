require_relative 'boot'


Bundler.require :default, ENV['SERVICE_APP_ENV']


module ServiceApp
  class Error < StandardError; end

  def self.configuration
    @configuration ||= OpenStruct.new
  end
  
  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= OpenStruct.new
  end

  def self.config
    @configuration
  end

  def self.db
    @db_connection
  end

  def self.env
    ENV['SERVICE_APP_ENV']
  end

  def self.root
    @root ||= Dir.pwd
  end

  def self.logger=(logger = Logger.new(STDOUT))
    @logger = logger
  end

  def self.logger
    @logger
  end

  def self.load_config_file(file_name, root, ext = 'yml')
    file_path = File.join(root, 'config', "#{file_name}.#{ext}")
    erb = ERB.new(File.read(file_path)).result
    configuration[file_name] = OpenStruct.new(YAML.load(erb).deep_symbolize_keys)
  end
end

log_file = File.open("#{ServiceApp.root}/log/#{ServiceApp.env}.log", File::WRONLY | File::APPEND | File::CREAT)

ServiceApp.logger = Logger.new(log_file)

ServiceApp.load_config_file('database', ServiceApp.root)
# ServiceApp.load_config_file('redis', ServiceApp.root)


# ServiceApp.configure do |conf|
#   conf.db_migration_directory = "#{ServiceApp.root}/db/migrations"

# end

require_relative 'initializers/active_record'



require_dirs = ['app/api', 'app/jobs', 'lib']

require_dirs.each do |path|
  path = File.expand_path(File.join(File.dirname(__FILE__), '..', path))

  $LOAD_PATH.unshift path

  Dir["#{path}/**/*.rb"].reject{ |el| el.include?('lib/tasks/import_active_record_tasks') }.sort.each do |f|
    require f
  end
end


require_relative 'initializers/sidekiq'
require_relative 'initializers/sidekiq_cron'
