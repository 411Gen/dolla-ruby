require 'dolla/base'

module Dolla
  class Taxon < Dolla::Base


    class Product < Dolla::Image

      belongs_to :taxon
    end
  end
end