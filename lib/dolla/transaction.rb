require 'dolla/base'

module Dolla
  class Transaction < Dolla::Base
    custom_endpoint :flag, on: :member, request_method: :put
  end
end