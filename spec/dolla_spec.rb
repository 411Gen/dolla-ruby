require 'spec_helper'
require "base64"

describe Dolla do
  it 'has a version number' do
    expect(Dolla::VERSION).not_to be nil
  end

  describe "sending API calls" do
    before do
      basic_auth_credentials = "12345:"

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
    end

    it 'sends an API call with the API key in the Authorization header' do
      Dolla.api_key = '12345'

      user = Dolla::User.find(1).first
      
      expect(user.email).to eq 'test@example.com'
    end
  end
end
