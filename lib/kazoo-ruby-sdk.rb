require 'kazoo-ruby-sdk/version'
require 'faraday'
require 'faraday_middleware'
require 'digest/md5'

require 'kazoo-ruby-sdk/configuration'
require 'kazoo-ruby-sdk/session'
require 'kazoo-ruby-sdk/base'
require 'kazoo-ruby-sdk/devices'
require 'kazoo-ruby-sdk/users'
require 'kazoo-ruby-sdk/callflows'

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