require 'bundler/gem_tasks'
require 'rake/testtask'
task :default => [:test]
task :test do
  Rake::TestTask.new do |t|
    t.pattern = "test/*"
    t.verbose = true
  end
end
