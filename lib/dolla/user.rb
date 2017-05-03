require 'dolla/base'

module Dolla
  class User < Dolla::Base

    # has_many :cards, class_name: "Dolla::Card"

    custom_endpoint :confirmation, on: :member, request_method: :put

    custom_endpoint :password, on: :member, request_method: :put

    custom_endpoint :unlock, on: :member, request_method: :put

    # has_many :cards
  end
end