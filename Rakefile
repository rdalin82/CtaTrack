require 'bundler/gem_tasks'
require 'rake/testtask'
task :default => [:test]
task :test do 
  Rake::TestTask.new do |t|
    t.pattern = "test/test*.rb"
    t.verbose = true
  end
end