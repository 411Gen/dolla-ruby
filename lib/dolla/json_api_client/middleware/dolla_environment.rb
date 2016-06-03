module Dolla
  module JsonApiClient
    module Middleware
      class DollaEnvironment < Faraday::Middleware

        def initialize(app = nil, resource_klass)
          super(app)

          @resource_klass = resource_klass
        end

        def call(environment)
          my_dolla_environment = dolla_environment.present? ? dolla_environment : 'live'

          environment[:request_headers]["X-Dolla-Environment"] = my_dolla_environment

          @app.call(environment)
        end



        def dolla_environment
          @resource_klass.custom_config.empty? ? Dolla.environment : @resource_klass.custom_config.fetch(:environment, nil)
        end
      end
    end
  end
end