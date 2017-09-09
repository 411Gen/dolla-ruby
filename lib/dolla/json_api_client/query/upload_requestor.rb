module Dolla
  module JsonApiClient
    module Query
      class UploadRequestor < ::JsonApiClient::Query::Requestor

        def initialize(klass, root = :upload)
          super(klass)
          
          @root = root
        end

        def create(record)
          payload = {}
          payload[@root] = record.upload_attributes

          upload_request(:post, klass.path(record.attributes), payload)
        end

        def update(record)
          payload = {}
          payload[@root] = record.upload_attributes

          upload_request(:patch, resource_path(record.attributes), payload)
        end

        protected

        def_delegators :klass, :upload_connection

        def upload_request(type, path, params)
          klass.parser.parse(klass, upload_connection.run(type, path, params, klass.custom_headers))
        end

      end

    end
  end
end
