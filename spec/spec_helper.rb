# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
require 'simplecov'
require "paperclip/matchers"

SimpleCov.start do
  add_filter "spec"
  add_group "Models",      "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Helpers",      "app/helpers"
end


require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require "factory_girl_rails"
require "database_cleaner"
require 'shoulda/matchers/integrations/rspec'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  # for getting the routes to work on the controllers and routing tests
  config.before(:each, type: :controller) { @routes = ZPages::Engine.routes }
  config.before(:each, type: :routing)    { @routes = ZPages::Engine.routes }
  config.before(:each, type: :requests)   { @routes = ZPages::Engine.routes }

  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  config.include Paperclip::Shoulda::Matchers
end

