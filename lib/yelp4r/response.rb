module Yelp4r
  class Response
    
    attr_accessor :body
    
    def initialize(body)
      @body = body
    end
    
    def response_code
      @body['message']['code']
    end
    
    def success?
      response_code == 0
    end
    
    def error_message
      @body['message']['text'] unless success?
    end
    
    def data
      if !@body['businesses'].blank?
        @body['businesses']
      elsif !@body['neighborhoods'].blank?
        @body['neighborhoods']
      end
    end
    
  end
end
