module KazooRubySdk
  module Connection

    def pipeline(api_url = nil)
      api_url ||= KazooRubySdk.configuration.api_url
      create_conn_object(api_url)
    end

    private

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
  end
end