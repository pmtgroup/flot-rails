# -*- encoding : utf-8 -*-

require 'active_support/configurable'

module Flot
  # Configures global settings for Flot
  #   Flot.configure do |config|
  #     config.default_height = 400 # px
  #   end
  def self.configure(&block)
    yield @config ||= self::Configuration.new
  end

  # Global settings for Flot
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable

    config_accessor(:default_height) { 300 }
    config_accessor(:default_width) { 600 }
  end
end
