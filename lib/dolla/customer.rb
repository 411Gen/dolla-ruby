require 'dolla/base'

module Dolla
  class Customer < Dolla::Base

    class Card < Dolla::Base
      belongs_to :customer
    end

    class Transaction < Dolla::Base
      belongs_to :customer
    end

  end
end