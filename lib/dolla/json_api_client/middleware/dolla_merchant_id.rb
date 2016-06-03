module Dolla
  module JsonApiClient
    module Middleware
      class DollaMerchantId < Faraday::Middleware

        def initialize(app = nil, resource_klass)
          super(app)

          @resource_klass = resource_klass
        end

        def call(environment)
          my_merchant_id = merchant_id.present? ? merchant_id : nil

          environment[:request_headers]["X-Dolla-Merchant-Id"] = my_merchant_id unless my_merchant_id.nil?

          @app.call(environment)
        end

        def merchant_id
          @resource_klass.custom_config.empty? ? Dolla.merchant_id : @resource_klass.custom_config.fetch(:merchant_id, nil)
        end
      end
    end
  end
end