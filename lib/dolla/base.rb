require "dolla/json_api_client/middleware/authentication"
require "dolla/json_api_client/middleware/dolla_environment"
require "dolla/json_api_client/middleware/dolla_merchant_id"
require "dolla/json_api_client/parsers/custom_parser"

module Dolla
  class Base < ::JsonApiClient::Resource
    self.parser = JsonApiClient::Parsers::CustomParser

    #self.site = "http://api.dolla.dev:5000/"
    self.site = "https://api.khoyn.com/"

    def self._build_connection(rebuild = false)
      super.tap do |connection|
        connection.use JsonApiClient::Middleware::Authentication, self
        connection.use JsonApiClient::Middleware::DollaEnvironment, self
        connection.use JsonApiClient::Middleware::DollaMerchantId, self
      end
    end

    # self.connection do |connection|
    #   connection.use JsonApiClient::Middleware::Authentication, self
    #   connection.use JsonApiClient::Middleware::DollaEnvironment, self
    #   connection.use JsonApiClient::Middleware::DollaMerchantId, self
    # end

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

    def self.load_from_hash(data)
      parser.parse_hash(self, data)
    end
  end
end

