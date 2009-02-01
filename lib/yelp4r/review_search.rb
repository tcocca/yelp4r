 module Yelp4r
  class ReviewSearch
    
    attr_accessor :client
    
    def initialize(client)
      @client = client
    end
    
    def search_by_bounding_box(tl_lat, tl_long, br_lat, br_long, optiona = {})
      options = {:tl_lat => tl_lat, :tl_long => tl_long, :br_lat => br_lat, :br_long => br_long}
      process(options, optional)
    end
    
    def search_by_geocode_and_radius(lat, long, optional = {})
      options = {:lat => lat, :long => long}
      process(options, optional)
    end
    
    def search_by_location(location, optional = {})
      options = {:location => location}
      process(options, optional)
    end
    
    private
    
    def process(options, optional)
      options.merge!(optional) unless optional.blank?
      Response.new(@client.class.get('/business_review_search', :query => options))
    end
  
  end
end
