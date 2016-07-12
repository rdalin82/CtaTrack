require 'bundler/gem_tasks'
files = Dir.glob("test/*")
task :default => :test

task :test do 
  files.each do |file|
    ruby "#{file}"
  end
end
