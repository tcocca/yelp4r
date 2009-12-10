module Yelp4r
  class Response
    
    attr_accessor :body
    
    def initialize(response)
      @body = mash_response(response)
    end
    
    def response_code
      @body.message.code
    end
    
    def success?
      response_code == 0
    end
    
    def error_message
      @body.message.text unless success?
    end
    
    def data
      if !@body.businesses.blank?
        @body.businesses
      elsif !@body.neighborhoods.blank?
        @body.neighborhoods
      end
    end
    
    private
    
    def mash_response(response)
      if response.is_a?(Array)
        @body = []
        response.each do |b|
          if b.is_a?(Hash)
            @body << Mash.new(b.rubyify_keys!)
          else
            @body << b
          end
        end
      elsif response.is_a?(Hash)
        @body = Mash.new(response.rubyify_keys!)
      else
        @body = response
      end
    end
    
  end
end
