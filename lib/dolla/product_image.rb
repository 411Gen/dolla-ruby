require 'dolla/image'

module Dolla
  class ProductImage < Dolla::Image

    belongs_to :product

    def self.table_name
      "images"
    end
  end
end