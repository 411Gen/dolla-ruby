require 'dolla/base'

module Dolla
  class OptionValue < Dolla::Base
    belongs_to :product
  end
end