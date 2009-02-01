require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/yelp4r'
require File.dirname(__FILE__) + '/../../lib/yelp4r/client'
require File.dirname(__FILE__) + '/../../lib/yelp4r/phone_search'
require File.dirname(__FILE__) + '/../../lib/yelp4r/response'

describe Yelp4r::PhoneSearch do
  include Yelp4rSpecHelper
  
  before do
    @client = yelp4r_client
    @phone_search = Yelp4r::PhoneSearch.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @phone_search.client.class.should == Yelp4r::Client
    end
  end
  
  describe 'phone_search' do
    it 'should return data on a valid phone number' do
      @results = phone_get('4155463149')
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should not return data on an invalid phone number' do
      @results = phone_get('415546314')
      @results.should_not be_success
      @results.data.should be_blank
      @results.error_message.should_not be_blank
    end
    
    def phone_get(*params)
      @phone_search.search_by_phone_number(*params)
    end
  end
  
end
