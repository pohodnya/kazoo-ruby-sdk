module KazooRubySdk
  class Devices < Base
    class << self
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
    end
  end
end