require 'active_support'
require 'active_support/core_ext'
require 'json'
require 'remotty/version'
require 'remotty/configuration'
require 'remotty/user'
require 'remotty/participation'
require 'remotty/comment'
require 'remotty/group'

module Remotty
  class << self
    attr_accessor :configuration
  end

  def self.client
    Remotty.configuration.client
  end

  def self.access_token(token)
    Remotty.configuration.access_token(token)
  end

  # Call this method to modify defaults in your initializers.
  #
  # @example
  #   Remotty.setup do |config|
  #     config.client_id = 'your client id'
  #     config.client_secret = 'your client secret'
  #     config.site = 'https://www.remotty.net'
  #   end
  def self.setup
    self.configuration ||= Configuration.new
    yield configuration
  end
end
