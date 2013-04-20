ENV["RAILS_ENV"] = 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'

require 'launchy'
require 'capybara/rspec'
require 'capybara/rails'
require 'parslet/rig/rspec'    # matchers for parslet...

require 'factory_girl_rails'

# if this is commented out, Capybara will use the default selenium driver
Capybara.javascript_driver = :webkit

Dir[Rails.root.join("spec/support.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_examples = false
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    is_request    = example.metadata[:type] == :request
    not_rack_test = Capybara.current_driver != :rack_test
    DatabaseCleaner.strategy = if is_request || not_rack_test
                                 :truncation
                               else
                                 :transaction
                               end
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
