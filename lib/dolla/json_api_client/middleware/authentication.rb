module Dolla
  module JsonApiClient
    module Middleware
      class Authentication < Faraday::Middleware

        def initialize(app = nil, resource_klass)
          super(app)

          @resource_klass = resource_klass
        end

        def call(environment)
          endpoint = { method: environment.method, path: environment.url.path.gsub(/(inv|txn)_.+/, ':id') }

          if unauthenticated_endpoints.include?(endpoint) and !credentials_exist?(email, password, api_key, jwt)
            # unauthenticated requests are for resources that aren't separated by environment
            # environment[:request_headers]["X-Dolla-Environment"] = 'live'
          else
            environment[:request_headers]["Authorization"] = authorization_credentials(email, password, api_key, jwt)
          end
          @app.call(environment)
        end

        def credentials_exist?(email, password, api_key, jwt)
          if !api_key.nil? or !jwt.nil?
            return true
          end

          !email.nil? and !password.nil?
        end


        def authorization_credentials(email, password, api_key, jwt)

          if email.nil? or password.nil?
            raise AuthenticationError.new("No API key or JSON Web Token provided") if api_key.nil? and jwt.nil?
          end

          credentials = nil

          if api_key.present?
            basic_auth_credentials = "#{api_key}:"

            credentials = "Basic #{Base64.encode64(basic_auth_credentials)}"
          elsif !email.nil? and !password.nil?
            basic_auth_credentials = "#{email}:#{password}"

            credentials = "Basic #{Base64.encode64(basic_auth_credentials)}"
          elsif jwt.present?
            credentials = "Bearer #{jwt}"
          end

          credentials
        end

        def email
          @resource_klass.custom_config.empty? ? Dolla.email : @resource_klass.custom_config.fetch(:email, nil)
        end

        def password
          @resource_klass.custom_config.empty? ? Dolla.password : @resource_klass.custom_config.fetch(:password, nil)
        end

        def api_key
          @resource_klass.custom_config.empty? ? Dolla.api_key : @resource_klass.custom_config.fetch(:api_key, nil)
        end

        def jwt
          @resource_klass.custom_config.empty? ? Dolla.jwt : @resource_klass.custom_config.fetch(:jwt, nil)
        end

        def unauthenticated_endpoints
          [
            {method: :post, path: '/users'},
            {method: :get, path: '/invoices/:id'},
            {method: :post, path: '/transactions'},
            {method: :get, path: '/transactions/:id'},
            {method: :get, path: '/merchants'},
            {method: :put, path: '/users/invitations'},
          ]
        end
      end
    end
  end
end