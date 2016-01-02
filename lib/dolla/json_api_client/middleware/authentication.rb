module Dolla
  module JsonApiClient
    module Middleware
      class Authentication < Faraday::Middleware
        def call(environment)
          endpoint = { method: environment.method, path: environment.url.path.gsub(/(inv|txn)_.+/, ':id') }

          if unauthenticated_endpoints.include?(endpoint) and !Dolla.credentials_exist?
            # unauthenticated requests are for resources that aren't separated by environment
            # environment[:request_headers]["X-Dolla-Environment"] = 'live'
          else
            environment[:request_headers]["Authorization"] = Dolla.authorization_credentials 
          end
          @app.call(environment)
        end

        def unauthenticated_endpoints
          [
            {method: :post, path: '/users'},
            {method: :get, path: '/invoices/:id'},
            {method: :post, path: '/transactions'},
            {method: :get, path: '/transactions/:id'},
          ]
        end
      end
    end
  end
end