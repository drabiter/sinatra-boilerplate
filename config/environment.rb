require 'yaml'

ENV['RACK_ENV'] ||= :development.to_s

db_options = YAML.load File.read('./config/database.yml')
puts "Environment #{ENV['RACK_ENV']}"
ActiveRecord::Base.establish_connection db_options[ENV['RACK_ENV']]
