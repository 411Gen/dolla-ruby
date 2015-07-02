require "json_api_client"
require "dolla/version"
require "dolla/user"
require "dolla/report"
require "dolla/errors/base_error"
require "dolla/errors/authentication_error"
require "dolla/json_api_client/middleware/authentication"
require "dolla/json_api_client/middleware/dolla_environment"

module Dolla
  class << self
    attr_accessor :api_key, :jwt, :environment
  end

  def self.authorization_credentials
    raise AuthenticationError.new("No API key or JSON Web Token provided") if self.api_key.nil? and self.jwt.nil?

    credentials = nil

    if self.api_key.present?
      basic_auth_credentials = "#{self.api_key}:"

      credentials = "Basic #{Base64.encode64(basic_auth_credentials)}"
    elsif self.jwt.present?
      credentials = "Bearer #{self.jwt}"
    end

    credentials
  end

  Base.connection do |connection|
    connection.use JsonApiClient::Middleware::Authentication
    connection.use JsonApiClient::Middleware::DollaEnvironment
  end
end
