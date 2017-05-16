module KazooRubySdk
  class ApiSession < Base
    attr_reader :auth_token, :api_url, :realm, :account_id, :owner_id, :pipe

    def initialize(options)
      @auth_token = options[:auth_token]
      @api_url = options[:api_url]
      @realm = options[:realm]
      @account_id = options[:account_id]
      @owner_id = options[:owner_id]
      @pipe = create_conn_object(api_url)
    end

    def list_devices
      pipe.get do |request|
        request.url "accounts/#{account_id}/devices"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def get_device(device_id)
      pipe.get do |request|
        request.url "accounts/#{account_id}/devices/#{device_id}"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def get_device_statuses
      pipe.get do |request|
        request.url "accounts/#{account_id}/devices/status"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def create_device(attributes)
      pipe.put do |request|
        request.url "accounts/#{account_id}/devices"
        request.headers['X-Auth-Token'] = auth_token
        request.body = { data: attributes }
      end.body
    end

    def update_device(device_id, attributes)
      pipe.patch do |request|
        request.url "accounts/#{account_id}/devices/#{device_id}"
        request.headers['X-Auth-Token'] = auth_token
        request.body = { data: attributes }
      end.body
    end

    def destroy_device(device_id)
      pipe.delete do |request|
        request.url "accounts/#{account_id}/devices/#{device_id}"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def create_user(attributes)
      pipe.put do |request|
        request.url "accounts/#{account_id}/users"
        request.headers['X-Auth-Token'] = auth_token
        request.body = { data: attributes }
      end.body
    end

    def update_user(user_id, attributes)
      pipe.patch do |request|
        request.url "accounts/#{account_id}/users/#{user_id}"
        request.headers['X-Auth-Token'] = auth_token
        request.body = { data: attributes }
      end.body
    end

    def list_users
      pipe.get do |request|
        request.url "accounts/#{account_id}/users"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def get_user(user_id)
      pipe.get do |request|
        request.url "accounts/#{account_id}/users/#{user_id}"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def destroy_user(user_id)
      pipe.delete do |request|
        request.url "accounts/#{account_id}/users/#{user_id}"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end
  end
end