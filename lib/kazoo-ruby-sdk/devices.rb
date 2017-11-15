module KazooRubySdk
  class Devices < Base

    def list
      pipe.get do |request|
        request.url "accounts/#{account_id}/devices"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def get(device_id)
      pipe.get do |request|
        request.url "accounts/#{account_id}/devices/#{device_id}"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def get_statuses
      pipe.get do |request|
        request.url "accounts/#{account_id}/devices/status"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def create(attributes)
      pipe.put do |request|
        request.url "accounts/#{account_id}/devices"
        request.headers['X-Auth-Token'] = auth_token
        request.body = { data: attributes }
      end.body
    end

    def update(device_id, attributes)
      pipe.patch do |request|
        request.url "accounts/#{account_id}/devices/#{device_id}"
        request.headers['X-Auth-Token'] = auth_token
        request.body = { data: attributes }
      end.body
    end

    def destroy(device_id)
      pipe.delete do |request|
        request.url "accounts/#{account_id}/devices/#{device_id}"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

  end
end