require 'dolla/image'

module Dolla
  class MerchantImage < Dolla::Image

    belongs_to :merchant

    def self.table_name
      "images"
    end
  end
end