require 'dolla/base'

module Dolla
  class UpSell < Dolla::Base
    belongs_to :product
  end
end