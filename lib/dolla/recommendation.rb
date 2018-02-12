require 'dolla/base'

module Dolla
  class Recommendation < Dolla::Base
    def self.table_name
      "recommendation"
    end

    custom_endpoint :products, on: :collection, request_method: :get
    custom_endpoint :collections, on: :collection, request_method: :get
  end
end