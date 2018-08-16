require 'dolla/base'

module Dolla
  class WalletPaymentSource < Dolla::Base

    def self.table_name
      "spaces/payment_sources"
    end
  end
end