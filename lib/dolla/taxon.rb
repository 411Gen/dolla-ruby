require 'dolla/base'

module Dolla
  class Taxon < Dolla::Base
    property :name

    validates :name, presence: true

    has_many :products

    custom_endpoint :add_product, on: :member, request_method: :post
    custom_endpoint :remove_product, on: :member, request_method: :delete
    custom_endpoint :move_product, on: :member, request_method: :post

    class Product < Dolla::Base

      belongs_to :taxon
    end
  end
end