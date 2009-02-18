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
    
    def options_from_list(selected = [])
      selected_opts = selected.collect {|s| s.strip}
      process_options(list, selected_opts)
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
    
    def process_options(item, selected, depth = 0, options = [])
      if item.is_a?(Hash)
        depth += 1
        item.each do |key, val|
          opt_selected = selected.include?(key) ? ' selected="selected"' : ''
          options << %(<option value="#{key}"#{opt_selected}>#{option_prefix(depth)}#{val[:display]}</option>)
          process_options(val[:children], selected, depth, options) if val[:children]
        end
        depth -= 1
      elsif item.is_a?(Array)
        item.each do |i|
          process_options(i, selected, depth, options)     
        end
      end
      return options
    end
    
    def option_prefix(depth)
      s = ""
      if depth > 1
        (depth - 1).times do 
          s += "&nbsp;-"
        end
        s += "&nbsp;"
      end
      return s
    end
    
  end
end
