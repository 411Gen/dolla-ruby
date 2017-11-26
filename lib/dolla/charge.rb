require 'dolla/base'

module Dolla
  class Charge < Dolla::Base

    custom_endpoint :init, on: :member, request_method: :put
  end
end