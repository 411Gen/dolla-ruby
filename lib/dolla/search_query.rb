require 'dolla/base'

module Dolla
  class SearchQuery < Dolla::Base
    custom_endpoint :convert, on: :member, request_method: :put
    custom_endpoint :completions, on: :collection, request_method: :get
  end
end