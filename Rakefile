# -*- encoding : utf-8 -*-

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
  sh "rm #{path} -rf" # cleanup

  cur = Dir.pwd
  Dir.chdir 'vendor/assets/javascripts/'
  File.open('jquery.flot.all.js', 'w') do |f|
    if File.exists?('excanvas.min.js')
      f.puts '//= require excanvas.min'
    elsif File.exists?('excanvas.js')
      f.puts '//= require excanvas'
    end
    self_name = File.basename(f.path, '.js')
    Dir['jquery*.js'].sort!.each do |file|
      js_file_name = File.basename(file, '.js')
      f.puts "//= require #{js_file_name}" if js_file_name != self_name # Do not require self
    end
  end
  Dir.chdir cur
  
  puts "\nNow you may type:\ngit commit LICENSE.FLOT.txt ./vendor/assets/javascripts/* -m 'flot-update #{Time.now.strftime('%Y-%m-%d')}'"
end
