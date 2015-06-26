module Dolla
  class Base < ::JsonApiClient::Resource
    self.site = "https://api.dollapayments.com/"
  end
end