require 'dolla/base'

module Dolla
  class Vendor < Dolla::Base
    property :name

    validates :name, presence: true
  end
end