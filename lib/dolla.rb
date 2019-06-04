require "json_api_client"
require "dolla/version"
require "dolla/base"
require "dolla/upload_base"
require "dolla/merchant"
require "dolla/user"
require "dolla/staff_member"
require "dolla/khoyn_staff_member"
require "dolla/jwt"
require "dolla/event"
require "dolla/customer"
require "dolla/report"
require "dolla/card"
require "dolla/verified_card"
require "dolla/wallet_payment_source"
require "dolla/payment_source"
require "dolla/transaction"
require "dolla/payout"
require "dolla/charge"
require "dolla/card_charge"
require "dolla/invoice"
require "dolla/file"
require "dolla/bank_account"
require "dolla/mobile_money_merchant_account"
require "dolla/mobile_money_operator"
require "dolla/facebook_bot"
require "dolla/permissions"
require "dolla/supported_bots"
require "dolla/app"
require "dolla/app_install"
require "dolla/option_type"
require "dolla/option_value"
require "dolla/product"
require "dolla/variant"
require "dolla/product_image"
require "dolla/variant_image"
require "dolla/merchant_image"
require "dolla/taxon_image"
require "dolla/search_query"
require "dolla/order"
require "dolla/payment"
require "dolla/line_item"
require "dolla/reseller_catalog_item"
require "dolla/relation_type"
require "dolla/relation"
require "dolla/taxon"
require "dolla/taxonomy"
require "dolla/shipping_category"
require "dolla/tax_category"
require "dolla/accessory"
require "dolla/up_sell"
require "dolla/cross_sell"
require "dolla/push_notification"
require "dolla/recommendation"
require "dolla/concept"
require "dolla/saved_address"
require "dolla/errors/base_error"
require "dolla/errors/authentication_error"

module Dolla
  class << self
    attr_accessor :api_key, :jwt, :environment, :email, :password, :merchant_id, :reseller_id, :site

    def site=(value)
      Base.class_eval do 
        self.site = value
      end

      UploadBase.class_eval do 
        self.site = value.gsub('api', 'uploads')
      end
    end
  end
end
