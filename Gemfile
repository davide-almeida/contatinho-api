# frozen_string_literal: true

source 'https://rubygems.org'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem 'rack-cors'

gem 'active_model_serializers', '~> 0.10.0' # https://github.com/rails-api/active_model_serializers
gem 'devise' # https://github.com/heartcombo/devise
gem 'devise-jwt' # https://github.com/waiting-for-dev/devise-jwt

group :development, :test do
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'factory_bot_rails' # https://github.com/thoughtbot/factory_bot_rails
  gem 'pry-byebug' # https://github.com/deivid-rodriguez/pry-byebug
  gem 'rspec-rails', '~> 6.1.0' # https://github.com/rspec/rspec-rails
  gem 'rubocop-rails', require: false # https://github.com/rubocop/rubocop-rails
  gem 'rubocop-rspec', require: false # https://github.com/rubocop/rubocop-rspec
end

group :test do
  gem 'shoulda-matchers', '~> 6.0' # https://github.com/thoughtbot/shoulda-matchers
  gem 'simplecov', require: false # https://github.com/simplecov-ruby/simplecov
end

group :developement do
  gem 'rails-erd' # https://github.com/voormedia/rails-erd
end
