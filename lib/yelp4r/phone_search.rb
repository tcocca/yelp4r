 module Yelp4r
  class PhoneSearch
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def search_by_phone_number(phone)
      process({:phone => phone})
    end
    
    private
    
    def process(options)
      Response.new(@client.class.get('/phone_search', :query => options))
    end
  
  end
end
