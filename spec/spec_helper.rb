require 'capybara/rspec'
require 'factory_girl'

require_relative '../app'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
end

Capybara.app = App

FactoryGirl.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryGirl.find_definitions
