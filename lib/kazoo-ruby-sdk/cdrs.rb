module KazooRubySdk
  class CDRs < Base
    class << self
      def range(from, to)
        pipe.get do |request|
          request.url "accounts/#{account_id}/cdrs?created_from=#{from}&created_to=#{to}"
          request.headers['X-Auth-Token'] = auth_token
        end.body
      end

      def get(cdr_id)
        pipe.get do |request|
          request.url "accounts/#{account_id}/cdrs/#{cdr_id}"
          request.headers['X-Auth-Token'] = auth_token
        end.body
      end

      def get_all_by_user(user_id)
        pipe.get do |request|
          request.url "accounts/#{account_id}/users/#{user_id}/cdrs"
          request.headers['X-Auth-Token'] = auth_token
        end.body
      end
    end
  end
end