module KazooRubySdk
  class Callflows < Base

    def create(attributes)
      pipe.put do |request|
        request.url "accounts/#{account_id}/callflows"
        request.headers['X-Auth-Token'] = auth_token
        request.body = { data: attributes }
      end.body
    end

    def update(callflow_id, attributes)
      pipe.patch do |request|
        request.url "accounts/#{account_id}/callflows/#{callflow_id}"
        request.headers['X-Auth-Token'] = auth_token
        request.body = { data: attributes }
      end.body
    end

    def list
      pipe.get do |request|
        request.url "accounts/#{account_id}/callflows"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def get(callflow_id)
      pipe.get do |request|
        request.url "accounts/#{account_id}/callflows/#{callflow_id}"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

    def destroy(callflow_id)
      pipe.delete do |request|
        request.url "accounts/#{account_id}/callflows/#{callflow_id}"
        request.headers['X-Auth-Token'] = auth_token
      end.body
    end

  end
end