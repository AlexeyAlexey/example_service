# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/environment'


# Importing Active Record Tasks
require_relative 'lib/tasks/import_active_record_tasks'
#

RAKE_REQUIRE_DIRS = ['lib/tasks'].freeze

RAKE_REQUIRE_DIRS.each do |path|
  path = File.expand_path(File.join(File.dirname(__FILE__), '/', path))

  $LOAD_PATH.unshift path

  Dir["#{path}/**/*.rake"].sort.each { |f| load f }
end
