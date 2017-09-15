require 'dolla/image'

module Dolla
  class VariantImage < Dolla::Image

    belongs_to :variant

    def self.table_name
      "images"
    end
  end
end