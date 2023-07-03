# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3', '>= 6.1.3'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

gem 'jwt_sessions', '~> 2.3'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'jwe'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'active_model_serializers', '~> 0.10.0'

gem 'carrierwave'
gem 'figaro'
gem 'fog-aws'
gem 'pg_search'

gem 'flipper-active_record'
gem 'flipper-api'
gem 'flipper-ui'
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false

gem "aws-sdk-s3", require: false

gem 'cancancan'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'listen', '~> 3.2'
  gem 'solargraph'
  gem 'solargraph-rails'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'tzinfo-data'

# for Flipper on windows
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
