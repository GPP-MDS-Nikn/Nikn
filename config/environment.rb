# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Initialize rails logger

Rails.logger = Logger.new(STDOUT)
config.log_level = :debug
