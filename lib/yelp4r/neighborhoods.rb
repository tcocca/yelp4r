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
            {child.inner_text => process_list(child.next_sibling)}
          elsif child.name == "li"
            child.inner_text
          end
        end
      end
    end
    
    def process_options(item, selected, depth = 0, options = [], parent = "")
      if item.is_a?(Hash)
        depth += 1
        item.each do |key, val|
          unless parent.blank?
            opt = "#{key}, #{parent}"
          else
            opt = key
          end
          opt_selected = selected.include?(opt) ? ' selected="selected"' : ''
          options << %(<option value="#{opt}"#{opt_selected}>#{option_prefix(depth)}#{key}</option>)
          process_options(val, selected, depth, options, opt)
        end
        depth -= 1
      elsif item.is_a?(Array)
        item.each do |i|
          process_options(i, selected, depth, options, parent)     
        end
      else
        depth += 1
        unless parent.blank?
          opt = "#{item}, #{parent}"
        else
          opt = item
        end
        opt_selected = selected.include?(opt) ? ' selected="selected"' : ''
        options << %(<option value="#{opt}"#{opt_selected}>#{option_prefix(depth)}#{item}</option>)
        depth -= 1
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
