require 'dolla/base'

module Dolla
  class Report < Dolla::Base

    custom_endpoint :dashboard, on: :collection, request_method: :get
  end
end