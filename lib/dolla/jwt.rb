require 'dolla/base'

module Dolla
  class Jwt < Dolla::Base

    def self.table_name
      "user"
    end

    custom_endpoint :jwt_token, on: :collection, request_method: :get

    def self.retrieve
      self.jwt_token
    end
  end
end