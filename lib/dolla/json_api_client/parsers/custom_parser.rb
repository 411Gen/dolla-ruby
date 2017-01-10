module Dolla
  module JsonApiClient
    module Parsers
      class CustomParser < ::JsonApiClient::Parsers::Parser

        def self.parse_hash(klass, data)
          ::JsonApiClient::ResultSet.new.tap do |result_set|
            result_set.record_class = klass
            #result_set.uri = response.env[:url]
            handle_json_api(result_set, data)
            handle_data(result_set, data)
            handle_errors(result_set, data)
            handle_meta(result_set, data)
            handle_links(result_set, data)
            handle_relationships(result_set, data)
            handle_pagination(result_set, data)
            handle_included(result_set, data)
          end
        end

      end
    end
  end
end