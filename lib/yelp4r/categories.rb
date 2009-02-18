module Yelp4r
  class Categories
    
    attr_accessor :parse_url
    
    def initialize
      @parse_url = "http://www.yelp.com/developers/documentation/category_list"
    end
    
    def list
      require 'hpricot'
      require 'open-uri'
      doc = open(parse_url) {|f| Hpricot(f)}
      list = doc.search("/html/body/div[3]/div/div[2]/ul")
      neighborhoods = process_list(list.first)
      return neighborhoods
    end
    
    private
    
    def process_list(item)
      item.children_of_type("li").map do |child|
        unless child.inner_text.nil?
          if child.next_sibling && child.next_sibling.name == "ul"
            str_vals = decode_string(child.inner_text)
            {str_vals[2] => {:display => str_vals[1], :children => process_list(child.next_sibling)}}
          elsif child.name == "li"
            str_vals = decode_string(child.inner_text)
            {str_vals[2] => {:display => str_vals[1]}}
          end
        end
      end
    end
    
    def decode_string(str)
      /(.*)\s\(([^\)]*)/.match(str)
    end
    
  end
end
