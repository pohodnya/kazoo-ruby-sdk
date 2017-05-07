module KazooRubySdk
  class AuthSession < Base
    attr_accessor :auth_url, :realm, :username, :password
    attr_reader :auth_pipe, :auth_token, :account_id, :owner_id

    def initialize
      @auth_url = KazooRubySdk.auth_url
      @realm = KazooRubySdk.realm
      @username = KazooRubySdk.username
      @password = KazooRubySdk.password

      @auth_pipe = create_conn_object(auth_url)
    end

    def is_authenticated?
      return !auth_token.nil?
    end

    def new_session
      authenticate! unless is_authenticated?
      return ApiSession.new(:auth_token => auth_token, :api_url => auth_url, :realm => realm, :account_id => account_id, :owner_id => owner_id)
    end

    def get_credentials_hash
      return Digest::MD5.hexdigest("#{username}:#{password}")
    end

    def authenticate!
      req = {:data => {:credentials => get_credentials_hash, :realm => realm}, :verb => 'PUT'}
      response = auth_pipe.put 'user_auth', req
      @auth_token = response.body.auth_token
      @account_id = response.body.data.account_id
      @owner_id = response.body.data.owner_id
      auth_token
    end

  end
end