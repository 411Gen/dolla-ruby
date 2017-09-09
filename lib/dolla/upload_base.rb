require "dolla/json_api_client/middleware/authentication"
require "dolla/json_api_client/middleware/dolla_environment"
require "dolla/json_api_client/middleware/dolla_merchant_id"
require "dolla/json_api_client/upload_connection"
require "dolla/json_api_client/query/upload_requestor"

module Dolla
  class UploadBase < Base
    class_attribute :upload_connection_object, :upload_connection_class

    self.upload_connection_class = JsonApiClient::UploadConnection
    self.requestor_class = JsonApiClient::Query::UploadRequestor

    # def initialize(params = {})
    #   self.class.connection = Faraday.new(self.site) do |conn|
    #     # POST/PUT params encoders:
    #     conn.request :multipart
    #     conn.request :url_encoded

    #     conn.use JsonApiClient::Middleware::Authentication, self.class
    #     conn.use JsonApiClient::Middleware::DollaEnvironment, self.class
    #     conn.use JsonApiClient::Middleware::DollaMerchantId, self.class

    #     # Last middleware must be the adapter:
    #     conn.adapter :net_http
    #   end

    #   #puts params.inspect

    #   self.attributes = params
    # end

    def self._build_upload_connection(rebuild = false)
      return upload_connection_object unless upload_connection_object.nil? || rebuild
      self.upload_connection_object = upload_connection_class.new(connection_options.merge(site: site.gsub('api', 'uploads'))).tap do |conn|
        conn.use JsonApiClient::Middleware::Authentication, self
        conn.use JsonApiClient::Middleware::DollaEnvironment, self
        conn.use JsonApiClient::Middleware::DollaMerchantId, self

        yield(conn) if block_given?
      end
    end

    def self.upload_connection(rebuild = false, &block)
      _build_upload_connection(rebuild, &block)
      upload_connection_object
    end

    def upload_attributes
      attributes
    end

    def inspect
      "#<#{self.class.name}:@attributes=#{upload_attributes.inspect}>"
    end
  end
end

