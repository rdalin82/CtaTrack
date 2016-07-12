require 'bundler/gem_tasks'
files = Dir.glob("test/*")
test_helper = Dir.glob("test/minitest_helper.rb")
task :default => :test

task :test do 
  # ruby test_helper[0]
  files.each do |file|
    puts "#{file}"
    ruby "#{file}"
  end
end
