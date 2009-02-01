module Yelp4r
  class Categories
    
    def self.list
      require 'hpricot'
      require 'open-uri'
      doc = open("http://www.yelp.com/developers/documentation/category_list") {|f| Hpricot(f)}
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
        str_vals = decode_string(item.inner_text)
        {str_vals[2] => {:display => str_vals[1], :children => process_list(item.next_sibling)}}
      elsif item.name == "li"
        str_vals = decode_string(item.inner_text)
        {str_vals[2] => {:display => str_vals[1]}}
      end
    end
    
    def self.decode_string(str)
      /(.*)\s\(([^\)]*)/.match(str)
    end
    
  end
end
