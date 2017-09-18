require 'dolla/base'

module Dolla
  class Accessory < Dolla::Base
    belongs_to :product
  end
end