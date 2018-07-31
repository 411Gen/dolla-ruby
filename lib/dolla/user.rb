require 'dolla/base'

module Dolla
  class User < Dolla::Base

    # has_many :cards, class_name: "Dolla::Card"

    custom_endpoint :confirmations, on: :member, request_method: :put

    custom_endpoint :passwords, on: :member, request_method: :put

    custom_endpoint :unlocks, on: :member, request_method: :put

    class Order < Dolla::Base
      belongs_to :user
    end

    class SavedAddress < Dolla::Base
      belongs_to :user
    end

    class Confirmation < Dolla::Base
      belongs_to :user
    end

    class Password < Dolla::Base
      belongs_to :user
    end

    class PaymentSource < Dolla::Base
      belongs_to :user

      def self.table_name
        "spaces/payment_sources"
      end
    end
  end
end