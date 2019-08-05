require 'dolla/base'

module Dolla
  class SavedAddress < Dolla::Base

    custom_endpoint :make_default, on: :member, request_method: :put
    custom_endpoint :archive, on: :member, request_method: :put
    custom_endpoint :unarchive, on: :member, request_method: :put
  end
end