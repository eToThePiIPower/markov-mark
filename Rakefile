require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ['--color', '--format', 'doc']
end

task default: [:spec]

desc 'Open a console'
task :console do
  lib = File.expand_path('../lib', __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
  require 'irb'
  require 'irb/completion'
  require 'engines/markov_engine'
  require 'parsers/playdoc_parser'
  ARGV.clear
  IRB.start
end
