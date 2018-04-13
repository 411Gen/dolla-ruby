require 'dolla/base'

module Dolla
  class Product < Dolla::Base

    custom_endpoint :reprocess_images, on: :member, request_method: :put
    custom_endpoint :featured, on: :collection, request_method: :get
    custom_endpoint :search_marketplace, on: :collection, request_method: :get
    custom_endpoint :search_marketplace_by_image, on: :collection, request_method: :get
    custom_endpoint :find_by_image, on: :collection, request_method: :get

    custom_endpoint :like, on: :member, request_method: :post
    custom_endpoint :dislike, on: :member, request_method: :post
    custom_endpoint :view, on: :member, request_method: :post
  end
end