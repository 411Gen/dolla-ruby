require 'dolla/base'

module Dolla
  class Product < Dolla::Base

    custom_endpoint :reprocess_images, on: :member, request_method: :put
    custom_endpoint :featured, on: :collection, request_method: :get
  end
end