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
    
    def neighborhoods
      require 'hpricot'
      require 'open-uri'
      # doc = open("http://www.yelp.com/developers/documentation/neighborhood_list") {|f| Hpricot(f)}
      h = Hpricot.XML(open("http://www.yelp.com/developers/documentation/neighborhood_list").read)
      attrs = h.search("/html/body/div[3]/div/div[2]/ul")
      attrs.search('ul').each {|item| puts "Start:\n#{item.inner_html}\nEnd:\n"}
    end
    
    private
    
    def process(options)
      Response.new(@client.class.get('/neighborhood_search', :query => options))
    end
    
  end
end
