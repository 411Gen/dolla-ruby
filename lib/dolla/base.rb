module Dolla
  class Base < ::JsonApiClient::Resource
    self.site = "http://api.lvh.me:5000/" #"https://api.dollapayments.com/"
    #self.site = "https://api.dollapayments.com/"
  end
end