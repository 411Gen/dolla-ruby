require 'dolla/base'

module Dolla
  class Invoice < Dolla::Base
    has_one :merchant, class_name: "Dolla::Merchant"
    has_one :customer, class_name: "Dolla::Customer"
  end
end