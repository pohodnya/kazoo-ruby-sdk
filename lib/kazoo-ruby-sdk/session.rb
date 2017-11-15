module KazooRubySdk
  class Session
    include KazooRubySdk::Connection

    def initialize(configuration = {})
      @api_url = configuration[:api_url]
      @realm = configuration[:realm] || KazooRubySdk.configuration.realm
      @username = configuration[:username] || KazooRubySdk.configuration.username
      @password = configuration[:password] || KazooRubySdk.configuration.password
    end

    def account_id
      auth_response.data.account_id
    end

    def owner_id
      auth_response.data.owner_id
    end

    def auth_token
      auth_response.auth_token
    end

    private

    def auth_response
      req = {
              :data => {
                :credentials => get_credentials_hash,
                :realm => @realm
              },
              :verb => 'PUT'
            }
      response = pipeline(@api_url).put 'user_auth', req
      response.body
    end

    def get_credentials_hash
      Digest::MD5.hexdigest("#{@username}:#{@password}")
    end
  end
end