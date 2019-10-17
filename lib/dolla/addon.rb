require 'dolla/base'

module Dolla
  class Addon < Dolla::Base
    custom_endpoint :activate, on: :member, request_method: :put
    custom_endpoint :cancel, on: :member, request_method: :put
  end
end