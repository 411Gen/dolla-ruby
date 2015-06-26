require "json_api_client"
require "dolla/version"
require "dolla/user"
require "dolla/errors/base_error"
require "dolla/errors/authentication_error"
require "dolla/json_api_client/middleware/authentication"

module Dolla
  # Your code goes here...
  class << self
    attr_accessor :api_key
  end

  def self.authorization_credentials
    raise AuthenticationError.new("No API key provided") if self.api_key.nil?

    basic_auth_credentials = "#{self.api_key}:"

    "Basic #{Base64.encode64(basic_auth_credentials)}"
  end

  Base.connection do |connection|
    connection.use JsonApiClient::Middleware::Authentication
  end
end
