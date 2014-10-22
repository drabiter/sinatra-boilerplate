require 'rubygems'
require 'rspec/core/rake_task'
require 'active_record'

ENV['RACK_ENV'] ||= :test.to_s

RSpec::Core::RakeTask.new :spec do |task|
  task.rspec_opts = ['-c', '-f progress', '-r ./spec/spec_helper.rb']
  task.pattern    = 'spec/**/*_spec.rb'
end

namespace :db do
  desc 'migrate database'

  task :migrate do
    require './config/environment'
    ActiveRecord::Migrator.migrate 'db/migrate'
  end

  task :reset do
    require './config/environment'
    ActiveRecord::Migrator.migrate 'db/migrate', 0
  end

  task :seed do
    ENV['RACK_ENV'] = :development.to_s
    require './config/environment'
    require './db/seeds'
  end
end

task default: ['spec']
