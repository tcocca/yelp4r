module Yelp4r
  class NeighborhoodSearch
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def search_by_geocode(lat, long)
      options = {:lat => lat, :long => long}
      process(options)
    end
    
    def search_by_location(location, cc = "")
      options = {:location => location}
      options.merge!({:cc => cc}) unless cc.blank?
      process(options)
    end
    
    private
    
    def process(options)
      Response.new(@client.class.get('/neighborhood_search', :query => options))
    end
    
  end
end
