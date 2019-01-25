module Dolla
  module JsonApiClient
    module Middleware
      class KhoynResellerId < Faraday::Middleware

        def initialize(app = nil, resource_klass)
          super(app)

          @resource_klass = resource_klass
        end

        def call(environment)
          my_reseller_id = reseller_id.present? ? reseller_id : nil

          environment[:request_headers]["X-Khoyn-Reseller-Id"] = my_reseller_id unless my_reseller_id.nil?

          @app.call(environment)
        end

        def reseller_id
          @resource_klass.custom_config.empty? ? Dolla.reseller_id : @resource_klass.custom_config.fetch(:reseller_id, nil)
        end
      end
    end
  end
end