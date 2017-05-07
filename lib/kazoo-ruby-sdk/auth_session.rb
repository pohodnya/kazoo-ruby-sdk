module KazooRubySdk
  class AuthSession < Base
    attr_accessor :auth_url, :realm, :username, :password
    attr_reader :auth_pipe, :auth_token, :account_id, :owner_id, :api_url, :api_pipe, :api_token

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
      return ApiSession.new(:auth_token => api_token, :api_url => api_url, :realm => realm, :account_id => account_id, :owner_id => owner_id)
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

      @api_pipe = create_conn_object(@auth_url)
      shared_auth
    end

    def shared_auth
      req = {:data => {:realm => realm, :account_id => account_id, :shared_token => auth_token}, :verb => 'PUT'}
      resp = @api_pipe.put 'shared_auth', req
      @api_token = resp.body.auth_token
      return api_token
    end

    def get_endpoint_apps
      auth_pipe.get do |request|
        request.url "accounts/#{account_id}/users/#{owner_id}"
        request.headers['X-Auth-Token'] = auth_token
      end
    end
  end
end