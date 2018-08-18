require 'dolla/base'

module Dolla
  class WalletPaymentSource < Dolla::Base

    custom_endpoint :make_default, on: :member, request_method: :put

    def self.table_name
      "spaces/payment_sources"
    end

    def self.type
      "payment_sources"
    end
  end
end