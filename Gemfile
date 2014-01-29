source 'https://rubygems.org'

ruby '2.1.0'
gem 'rails', '4.0.2'

gem 'pg'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'geocoder'
gem 'rest_client'
gem 'figaro'
gem 'eco'

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'quiet_assets'
  gem 'thin'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'capybara'
  gem 'selenium-webdriver', "~> 2.39.0"
end

group :development, :test do
  gem 'ffaker'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'debugger'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
