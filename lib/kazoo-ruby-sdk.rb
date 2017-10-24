require 'digest/md5'
require 'faraday'
require 'faraday_middleware'
require 'kazoo-ruby-sdk/version'

require 'kazoo-ruby-sdk/base'
require 'kazoo-ruby-sdk/callflows'
require 'kazoo-ruby-sdk/cdrs'
require 'kazoo-ruby-sdk/configuration'
require 'kazoo-ruby-sdk/devices'
require 'kazoo-ruby-sdk/phone_numbers'
require 'kazoo-ruby-sdk/session'
require 'kazoo-ruby-sdk/users'

module KazooRubySdk
  class << self
    attr_accessor :configuration, :cache
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.cache
    @cache
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    self.cache = ActiveSupport::Cache::MemoryStore.new expires_in: 5.minutes
    yield(configuration)
  end
end
