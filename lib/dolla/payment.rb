require 'dolla/base'

module Dolla
  class Payment < Dolla::Base

    custom_endpoint :status, on: :member, request_method: :get
  end
end