module KazooRubySdk
  class Base
    class << self
      attr_accessor :auth_token, :api_url, :realm, :account_id, :owner_id, :pipe
    end

    private

    def self.auth_token
      KazooRubySdk::Session.auth_token
    end

    def self.api_url
      KazooRubySdk::Session.api_url
    end

    def self.realm
      KazooRubySdk::Session.realm
    end

    def self.account_id
      KazooRubySdk::Session.account_id
    end

    def self.owner_id
      KazooRubySdk::Session.owner_id
    end

    def self.pipe
      KazooRubySdk::Session.pipe
    end
  end
end