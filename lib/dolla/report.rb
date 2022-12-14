require 'dolla/base'

module Dolla
  class Report < Dolla::Base

    custom_endpoint :dashboard, on: :collection, request_method: :get
    custom_endpoint :total_revenue, on: :collection, request_method: :get
    custom_endpoint :products_series, on: :collection, request_method: :get
    custom_endpoint :merchants_series, on: :collection, request_method: :get
    custom_endpoint :customers_series, on: :collection, request_method: :get
    custom_endpoint :transactions_series, on: :collection, request_method: :get
    custom_endpoint :completed_orders_series, on: :collection, request_method: :get
    custom_endpoint :payouts_series, on: :collection, request_method: :get
    custom_endpoint :pending_orders, on: :collection, request_method: :get
    custom_endpoint :influencer_stats, on: :collection, request_method: :get
  end
end