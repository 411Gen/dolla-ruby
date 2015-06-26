module Dolla
  module JsonApiClient
    module Middleware
      class Authentication < Faraday::Middleware
        def call(environment)
          environment[:request_headers]["Authorization"] = Dolla.authorization_credentials
          @app.call(environment)
        end
      end
    end
  end
end