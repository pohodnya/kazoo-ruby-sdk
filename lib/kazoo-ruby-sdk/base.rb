module KazooRubySdk
  class Base
    include KazooRubySdk::Connection

    def initialize(configuration = {})
      @session = KazooRubySdk::Session.new(configuration)
      @configuration = configuration
    end

    def auth_token
      @session.auth_token
    end

    def account_id
      @session.account_id
    end

    def owner_id
      @session.owner_id
    end

    def pipe
      pipeline(@configuration[:api_url])
    end
  end
end