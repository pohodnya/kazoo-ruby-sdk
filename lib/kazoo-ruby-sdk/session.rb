module KazooRubySdk
  class Session
    class << self
      attr_writer :api_url, :realm, :account_id, :owner_id, :auth_token, :pipe
    end

    class << self
      def api_url
        KazooRubySdk::Configuration.api_url
      end

      def realm
        KazooRubySdk::Configuration.realm
      end

      def account_id
        auth_response.account_id
      end

      def owner_id
        auth_response.owner_id
      end

      def auth_token
        auth_response.auth_token
      end

      def pipe
        create_conn_object(api_url)
      end

      def create_conn_object(url)
        Faraday.new(:url => url, ssl: { verify: false }) do |builder|
          builder.use Faraday::Response::Mashify
          builder.use Faraday::Response::ParseJson
          builder.use Faraday::Response::RaiseError
          builder.use FaradayMiddleware::EncodeJson
          builder.use Faraday::Request::UrlEncoded
          builder.adapter Faraday.default_adapter
        end
      end

      private
      def auth_response
        KazooRubySdk.cache.fetch('auth_response') do
          req = {:data => {:credentials => get_credentials_hash, :realm => self.realm}, :verb => 'PUT'}
          response = self.auth_pipe.put 'user_auth', req
          response.body
        end
      end

      def get_credentials_hash
        Digest::MD5.hexdigest("#{KazooRubySdk::Configuration.username}:#{KazooRubySdk::Configuration.password}")
      end
    end
  end
end