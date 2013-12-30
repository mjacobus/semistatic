# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"
require 'simplecov'

require 'simplecov'
SimpleCov.start 'rails'

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!('rails')
end


require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require "factory_girl_rails"
require "database_cleaner"
require 'shoulda/matchers'
require "paperclip/matchers"

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

SPEC_ROOT = File.join(ENGINE_RAILS_ROOT, "spec")
TEST_IMAGE = File.join(SPEC_ROOT, "/support/300x400.jpg")

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  # for getting the routes to work on the controllers and routing tests
  config.before(:each, type: :controller) { @routes = Semistatic::Engine.routes }
  config.before(:each, type: :routing)    { @routes = Semistatic::Engine.routes }
  config.before(:each, type: :requests)   { @routes = Semistatic::Engine.routes }

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

