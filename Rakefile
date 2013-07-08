require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/testtask'

# Run the test with 'rake' or 'rake test'
desc 'Default: run acts_as_list unit tests.'
task :default => :test

desc 'Test the acts_as_list plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end
