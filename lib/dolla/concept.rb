require 'dolla/base'

module Dolla
  class Concept < Dolla::Base
    property :name

    validates :name, presence: true
  end
end