source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


group :development do 
	gem 'sqlite3'
	gem 'rspec-rails'
	gem "quiet_assets", ">= 1.0.1"
	gem "factory_girl_rails"
	gem 'rails_layout'
end
group :test do
    gem 'sqlite3'
	gem 'rspec-rails'
	gem 'simplecov', :require => false
	gem 'cucumber-rails', :require => false
	gem 'cucumber-rails-training-wheels'
	#gem 'capybara'
    # database_cleaner is not required, but highly recommended
    gem 'database_cleaner'
	gem 'rake'
	gem "factory_girl_rails"
end


group :production do 
	gem 'pg'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

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
#gem "bootstrap-sass", ">= 2.1.0.0"
gem 'bootstrap-sass'
gem "devise", ">= 2.1.2"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.0.3"
