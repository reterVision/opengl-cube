require 'rubygems'

require 'hoe'
require 'rake/testtask'
require 'rake/clean'

NAME = 'opengl-cube'

# the same as before
Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test