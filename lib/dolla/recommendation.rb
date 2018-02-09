require 'dolla/base'

module Dolla
  class Recommendation < Dolla::Base
    def self.table_name
      "recommendation"
    end
  end
end