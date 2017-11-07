require 'dolla/base'

module Dolla
  class Product < Dolla::Base

    custom_endpoint :reprocess_images, on: :member, request_method: :put
  end
end