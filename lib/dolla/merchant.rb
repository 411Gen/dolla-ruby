require 'dolla/base'

module Dolla
  class Merchant < Dolla::Base

    class Customer < Dolla::Base
      belongs_to :merchant#, class_name: '::Dolla::Merchant'
    end
  end
end