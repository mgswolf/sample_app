source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'bcrypt-ruby', '~> 3.0.1'
gem 'faker', '~> 1.1.2'
gem 'will_paginate', '~> 3.0.3'
gem 'bootstrap-will_paginate', '~> 0.0.9'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'




# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "twitter-bootstrap-rails"
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
   gem 'guard'
   gem 'guard-rspec'
   gem 'rb-inotify', :require => false
   gem 'libnotify'
   gem 'annotate', '~> 2.5.0'
   gem 'debugger'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'pry'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'fuubar'
  gem 'spork', '~> 1.0rc'
  gem 'guard-spork'
  gem 'guard-cucumber'
  gem 'cucumber-rails', '~> 1.3.0', require: false
  gem 'database_cleaner', '~> 0.8.0'
  gem 'launchy'
end

group :production do
  gem 'pg'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
