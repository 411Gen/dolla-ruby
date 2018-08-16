require 'dolla/base'

module Dolla
  class VerifiedCard < Dolla::Base

    custom_endpoint :check_verified, on: :member, request_method: :put
  end
end