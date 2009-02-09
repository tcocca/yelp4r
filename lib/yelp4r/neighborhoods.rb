module Yelp4r
  class Neighborhoods
    
    attr_accessor :parse_url
    
    def initialize
      @parse_url = "http://www.yelp.com/developers/documentation/neighborhood_list"
    end
    
    def list
      require 'hpricot'
      require 'open-uri'
      doc = open(parse_url) {|f| Hpricot(f)}
      list = doc.search("/html/body/div[3]/div/div[2]/ul")
      @neighborhoods = process_list(list.first)
      return @neighborhoods
    end
    
    private
    
    def process_list(item)
      item.children_of_type("li").map do |child|
        process_children(child) unless child.inner_text.nil?
      end
    end
    
    def process_children(item)
      if item.next_sibling && item.next_sibling.name == "ul"
        {item.inner_text => process_list(item.next_sibling)}
      elsif item.name == "li"
        item.inner_text
      end
    end
    
  end
end
