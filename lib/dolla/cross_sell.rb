require 'dolla/base'

module Dolla
  class CrossSell < Dolla::Base
    belongs_to :product
  end
end