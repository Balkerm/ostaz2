require 'simplecov'
SimpleCov.start 'rails'
SimpleCov.coverage_dir 'coverage/cucumber'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ostaz2::Application.initialize!
