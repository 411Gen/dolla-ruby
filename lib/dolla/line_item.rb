require 'dolla/base'

module Dolla
  class LineItem < Dolla::Base
    belongs_to :order
  end
end