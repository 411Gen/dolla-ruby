require 'dolla/base'

module Dolla
  class Report < Dolla::Base

    custom_endpoint :dashboard, on: :collection, request_method: :get
    custom_endpoint :merchants_series, on: :collection, request_method: :get
    custom_endpoint :customers_series, on: :collection, request_method: :get
    custom_endpoint :transactions_series, on: :collection, request_method: :get
    custom_endpoint :payouts_series, on: :collection, request_method: :get
  end
end