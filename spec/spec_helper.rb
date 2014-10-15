require 'capybara/rspec'
require 'factory_girl'
require 'database_cleaner'

require './app'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods

  config.before :suite do
    DatabaseCleaner[:active_record].clean_with :truncation
  end

  config.before :each do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner[:active_record].start
  end

  config.after :each do
    DatabaseCleaner[:active_record].clean
  end
end

Capybara.app = App

FactoryGirl.definition_file_paths = %w(./spec/factories)
FactoryGirl.find_definitions
