require 'dolla/base'

module Dolla
  class Taxon < Dolla::Base

    custom_endpoint :add_product, on: :member, request_method: :post
    custom_endpoint :remove_product, on: :member, request_method: :delete

    class Product < Dolla::Base

      belongs_to :taxon
    end
  end
end