require 'dolla/base'

module Dolla
  class Customer < Dolla::Base

    class Transaction < Dolla::Base
      belongs_to :customer
    end

    class Invoice < Dolla::Base
      belongs_to :customer
    end



  end
end