module Yelp4r
  class Neighborhoods
    
    def self.list
      require 'hpricot'
      require 'open-uri'
      doc = open("http://www.yelp.com/developers/documentation/neighborhood_list") {|f| Hpricot(f)}
      list = doc.search("/html/body/div[3]/div/div[2]/ul")
      @neighborhoods = process_list(list.first)
      return @neighborhoods
    end
    
    private
    
    def self.process_list(item)
      item.children_of_type("li").map do |child|
        process_children(child) unless child.inner_text.nil?
      end
    end
    
    def self.process_children(item)
      if item.next_sibling && item.next_sibling.name == "ul"
        {item.inner_text => process_list(item.next_sibling)}
      elsif item.name == "li"
        item.inner_text
      end
    end
    
  end
end
