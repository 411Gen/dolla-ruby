require 'dolla/base'

module Dolla
  class Order < Dolla::Base

    custom_endpoint :next, on: :member, request_method: :put
    custom_endpoint :complete, on: :member, request_method: :put
  end
end