module Dolla
  module JsonApiClient
    module Middleware
      class Authentication < Faraday::Middleware
        def call(environment)
          endpoint = { method: environment.method, path: environment.url.path }

          if unauthenticated_endpoints.include?(endpoint)
            # unauthenticated requests are for resources that aren't separated by environment
            environment[:request_headers]["X-Dolla-Environment"] = 'live'
          else
            environment[:request_headers]["Authorization"] = Dolla.authorization_credentials 
          end
          @app.call(environment)
        end

        def unauthenticated_endpoints
          [
            {method: :post, path: '/users'}
          ]
        end
      end
    end
  end
end