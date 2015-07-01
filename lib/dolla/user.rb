require 'dolla/base'

module Dolla
  class User < Dolla::Base

    custom_endpoint :confirmation, on: :member, request_method: :put

    custom_endpoint :password, on: :member, request_method: :put

    custom_endpoint :unlock, on: :member, request_method: :put
  end
end