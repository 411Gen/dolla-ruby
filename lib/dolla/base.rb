require "dolla/json_api_client/middleware/authentication"
require "dolla/json_api_client/middleware/dolla_environment"

module Dolla
  class Base < ::JsonApiClient::Resource
    #self.site = "https://api.dollapayments.com/"
    self.site = "http://api.lvh.me:5000/"

    self.connection do |connection|
      connection.use JsonApiClient::Middleware::Authentication
      connection.use JsonApiClient::Middleware::DollaEnvironment
    end
  end
end