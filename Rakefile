require 'rubygems'
require 'rspec/core/rake_task'

ENV['RACK_ENV'] = :test.to_s

RSpec::Core::RakeTask.new :spec do |task|
  task.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  task.pattern    = 'spec/**/*_spec.rb'
end

task :default => ['spec']
