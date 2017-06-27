require "json_api_client"
require "dolla/version"
require "dolla/base"
require "dolla/merchant"
require "dolla/user"
require "dolla/staff_member"
require "dolla/jwt"
require "dolla/event"
require "dolla/customer"
require "dolla/report"
require "dolla/card"
require "dolla/payment_source"
require "dolla/transaction"
require "dolla/charge"
require "dolla/invoice"
require "dolla/file"
require "dolla/permissions"
require "dolla/bank_account"
require "dolla/mobile_money_merchant_account"
require "dolla/mobile_money_operator"
require "dolla/facebook_bot"
require "dolla/errors/base_error"
require "dolla/errors/authentication_error"

module Dolla
  class << self
    attr_accessor :api_key, :jwt, :environment, :email, :password, :merchant_id, :site

    def site=(value)
      Base.class_eval do 
        self.site = value
      end
    end
  end
end
