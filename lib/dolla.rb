require "json_api_client"
require "dolla/version"
require "dolla/user"
require "dolla/jwt"
require "dolla/customer"
require "dolla/report"
require "dolla/card"
require "dolla/errors/base_error"
require "dolla/errors/authentication_error"

module Dolla
  class << self
    attr_accessor :api_key, :jwt, :environment, :email, :password
  end

  def self.authorization_credentials

    if self.email.nil? or self.password.nil?
      raise AuthenticationError.new("No API key or JSON Web Token provided") if self.api_key.nil? and self.jwt.nil?
    end

    credentials = nil

    if self.api_key.present?
      basic_auth_credentials = "#{self.api_key}:"

      credentials = "Basic #{Base64.encode64(basic_auth_credentials)}"
    elsif !self.email.nil? and !self.password.nil?
      basic_auth_credentials = "#{self.email}:#{self.password}"

      credentials = "Basic #{Base64.encode64(basic_auth_credentials)}"
    elsif self.jwt.present?
      credentials = "Bearer #{self.jwt}"
    end

    credentials
  end
end
