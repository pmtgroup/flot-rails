# -*- coding: utf-8 -*-
# -*- ruby -*-

# require 'rubygems'
# require "bundler/gem_tasks"
require 'tempfile'

desc 'Pull latest flot-version'
task :update_flot do
  path = RUBY_PLATFORM =~ /(mswin|mingw)/ ? 'C:\\TEMP\\flot' : '/tmp/flot'
  
  sh "rm #{path} -rf"
  sh "mkdir #{path}"
  sh "git clone --depth 1 https://github.com/flot/flot.git #{path}"
  
  sh "cp #{File.join(path, '*.js')} ./vendor/assets/javascripts/"
  sh "cp #{File.join(path, 'LICENSE.txt')} ./LICENSE.FLOT.txt"
  sh 'rm ./vendor/assets/javascripts/jquery.js'
  
  cur = Dir.pwd
  Dir.chdir 'vendor/assets/javascripts/'
  File.open('jquery.flot.all.js', 'w'){|f| Dir['*.js'].each{|file| f.puts "//= require #{File.basename(file, '.js')}" }}
  Dir.chdir cur
  
  puts "git commit LICENSE.FLOT.txt ./vendor/assets/javascripts/* -m 'flot-update #{Time.now.strftime('%Y-%m-%d')}'"
end
