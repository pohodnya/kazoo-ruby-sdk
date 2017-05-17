module KazooRubySdk
  class Users < Base
    class << self
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
end