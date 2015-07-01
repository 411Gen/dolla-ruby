require 'spec_helper'
require "base64"

describe Dolla do
  it 'has a version number' do
    expect(Dolla::VERSION).not_to be nil
  end

  describe "sending API calls" do
    before do
      basic_auth_credentials = "12345:"
      jwt_token = '12345.12345.12345'

      stub_request(:get, "https://#{basic_auth_credentials}@api.dollapayments.com/users/1")
        .to_return(headers: {content_type: "application/vnd.api+json"}, body: {
          data: [{
            type: "users",
            id: "1",
            attributes: {
              email: "test@example.com"
            }
          }]
        }.to_json)

      stub_request(:get, "https://api.dollapayments.com/users/1")
        .to_return(headers: {content_type: "application/vnd.api+json", authorization: "Bearer #{jwt_token}"}, body: {
          data: [{
            type: "users",
            id: "1",
            attributes: {
              email: "test@example.com"
            }
          }]
        }.to_json)


      stub_request(:post, "https://api.dollapayments.com/users")
        .to_return(headers: {content_type: "application/vnd.api+json"}, body: {
          data: [{
            type: "users",
            id: "1",
            attributes: {
              email: "test@example.com"
            }
          }]
        }.to_json)
    end

    it 'sends an API call with the API key in the Authorization header' do
      Dolla.api_key = '12345'

      user = Dolla::User.find(1).first
      
      expect(user.email).to eq 'test@example.com'
    end

    it 'sends an API call with the JSON Web Token in the Authorization header' do
      Dolla.jwt = '12345.12345.12345'

      user = Dolla::User.find(1).first
      
      expect(user.email).to eq 'test@example.com'
    end

    it "throws an error if an API key or JWT token isn't provided for an authenticated endpoint" do
      Dolla.api_key = nil
      Dolla.jwt = nil

      expect{Dolla::User.find(1)}.to raise_error(Dolla::AuthenticationError)
    end

    it "does not require authentication for user creation" do
      Dolla.api_key = nil
      Dolla.jwt = nil

      expect{Dolla::User.create(email: 'test123@example.com', password: 'test1234', password_confirmation: 'test1234')}.not_to raise_error
    end

    it "does not require authentication to access the forgot password endpoint"
  end
end
