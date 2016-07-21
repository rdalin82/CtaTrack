require 'bundler/gem_tasks'
require 'rake/testtask'
task :default => [:test]
task :test do 
  Rake::TestTask.new do |t|
    t.libs << "tests"
    t.test_files = FileList['test/*.rb']
    t.verbose = true
  end
end