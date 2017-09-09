require "dolla/json_api_client/middleware/form_request_json_response"

module Dolla
  module JsonApiClient
    class UploadConnection < ::JsonApiClient::Connection
      def initialize(options = {})
        site = options.fetch(:site)
        connection_options = options.slice(:proxy, :ssl, :request, :headers, :params)
        adapter_options = Array(options.fetch(:adapter, Faraday.default_adapter))
        @faraday = Faraday.new(site, connection_options) do |builder|
          builder.request :multipart
          builder.request :url_encoded

          builder.use Middleware::FormRequestJsonResponse
          builder.use ::JsonApiClient::Middleware::Status
          builder.use ::JsonApiClient::Middleware::ParseJson
          builder.adapter(*adapter_options)
        end
        yield(self) if block_given?
      end

    end
  end
end