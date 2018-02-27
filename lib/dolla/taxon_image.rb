require 'dolla/image'

module Dolla
  class TaxonImage < Dolla::Image

    belongs_to :taxon

    def self.table_name
      "images"
    end
  end
end