require "dolla/json_api_client/middleware/authentication"
require "dolla/json_api_client/middleware/dolla_environment"
require "dolla/json_api_client/middleware/dolla_merchant_id"
require "dolla/json_api_client/parsers/custom_parser"
# require "json_api_client/helpers/dynamic_attributes"

module Dolla
  class UploadBase
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::Validations
    include ActiveModel::Conversion
    include ActiveModel::Serialization

    include ::JsonApiClient::Helpers::DynamicAttributes

    cattr_accessor :site, :parser,

    cattr_accessor :connection
    
    self.site = "https://api.khoyn.com/"

    def initialize(params = {})
      self.class.connection = Faraday.new(self.site) do |conn|
        # POST/PUT params encoders:
        conn.request :multipart
        conn.request :url_encoded

        conn.use JsonApiClient::Middleware::Authentication, self.class
        conn.use JsonApiClient::Middleware::DollaEnvironment, self.class
        conn.use JsonApiClient::Middleware::DollaMerchantId, self.class

        # Last middleware must be the adapter:
        conn.adapter :net_http
      end

      #puts params.inspect

      self.attributes = params
    end

    def self.with_config(options = {})
      self.custom_config = options
      yield
      self.custom_config = {}
    end

    def self.custom_config
      key = "dolla-rb-config"
      Thread.current[key] ||= {}
    end

    def self.custom_config=(options)
      key = "dolla-rb-config"
      Thread.current[key] = options
    end

    def upload_attributes
      attributes
    end

    def inspect
      "#<#{self.class.name}:@attributes=#{upload_attributes.inspect}>"
    end
  end
end

