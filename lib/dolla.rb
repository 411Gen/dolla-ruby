require "json_api_client"
require "dolla/version"
require "dolla/user"
require "dolla/jwt"
require "dolla/customer"
require "dolla/report"
require "dolla/card"
require "dolla/transaction"
require "dolla/invoice"
require "dolla/merchant"
require "dolla/errors/base_error"
require "dolla/errors/authentication_error"

module Dolla
  class << self
    attr_accessor :api_key, :jwt, :environment, :email, :password, :merchant_id
  end
end
