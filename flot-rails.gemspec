# -*- encoding: utf-8 -*-
require File.expand_path('../lib/flot-rails/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "flot-rails"
  s.version     = Flot::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Holger Arndt"]
  s.email       = ["arndt@comcard.de"]
  s.homepage    = "https://github.com/flot/flot"
  s.summary     = "Use flot with Rails 3"
  s.description = "This gem provides flot driver for your Rails 3 application."

  s.required_rubygems_version = ">= 1.3.6"
  s.add_dependency "jquery-rails", ">= 2.0.2"
  
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_path = 'lib'
end
