source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', ' ~> 4.0.3'
gem 'bootstrap-sass', '2.3.2.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
    gem 'sqlite3', '1.3.9'
    gem 'rspec-rails', '2.11.0'
    gem 'guard-rspec', '2.5.0'
    gem 'spork-rails', github: 'sporkrb/spork-rails'
    gem 'guard-spork', '1.5.0'
    gem 'childprocess', '0.3.9'
    gem 'database_cleaner', '1.2.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.1'
  gem 'coffee-rails', '~> 4.0.0'

  # See https://github.c2m/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.2.3'
end

gem 'jquery-rails', '2.0.2'

group :test do
    gem 'selenium-webdriver', '~> 2.35.1'
    gem 'capybara', '2.1.0'
    gem 'growl', '1.0.3'
    gem 'factory_girl_rails', '4.2.1'

    gem 'cucumber-rails', '1.4.0', :require => false
end

group :production do
    gem 'pg', '0.15.1'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.5'

gem 'faker', '1.1.2'
# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
