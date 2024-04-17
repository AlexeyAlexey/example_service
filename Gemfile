source "https://rubygems.org"

ruby "3.2.3"

gem 'grape', '~> 2.0.0'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

gem 'bootsnap', require: false

gem 'erb', '~> 4.0.0'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

gem 'activerecord', '~> 7.1', '>= 7.1.3.2'

gem 'sidekiq', '~> 7.2', '>= 7.2.2'
gem 'sidekiq-cron', '~> 1.12'

group :test do
  gem 'rack-test', '~> 2.1'
  gem 'rspec', '~> 3.4'
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'dotenv', '~> 3.1'
  gem 'localhost'
end
