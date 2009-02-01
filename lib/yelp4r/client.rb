module Yelp4r
  class Client
    
    include HTTParty
    base_uri 'api.yelp.com'
    format :json
    
    def initialize(ywsid)
      self.class.default_params :ywsid => ywsid
    end
    
  end
end
