require 'kazoo-ruby-sdk/version'
require 'faraday'
require 'faraday_middleware'
require 'digest/md5'

require 'kazoo-ruby-sdk/base'
require 'kazoo-ruby-sdk/auth_session'
require 'kazoo-ruby-sdk/api_session'

module KazooRubySDK
  class<< self
    attr_accessor :auth_url, :realm, :username, :password
  end
end