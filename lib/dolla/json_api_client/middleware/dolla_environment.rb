module Dolla
  module JsonApiClient
    module Middleware
      class DollaEnvironment < Faraday::Middleware
        def call(environment)
          dolla_environment = Dolla.environment.present? ? Dolla.environment : 'live'

          environment[:request_headers]["X-Dolla-Environment"] = dolla_environment

          @app.call(environment)
        end
      end
    end
  end
end