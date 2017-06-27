require 'dolla/base'

module Dolla
  class FacebookBot < Dolla::Base
    has_one :merchant, class_name: "Dolla::Merchant"
  end
end