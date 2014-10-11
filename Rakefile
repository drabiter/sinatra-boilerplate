require 'rubygems'
require 'rspec/core/rake_task'
require 'active_record'

ENV['RACK_ENV'] = :test.to_s

RSpec::Core::RakeTask.new :spec do |task|
  task.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  task.pattern    = 'spec/**/*_spec.rb'
end

namespace :db do
  desc 'migrate database'
  task :migrate do
    # require 'bundler'
    # Bundler.require
    require './config/environment'
    ActiveRecord::Migrator.migrate 'db/migrate'
  end
end

task :default => ['spec']
