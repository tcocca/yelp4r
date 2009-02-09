require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/yelp4r'
require File.dirname(__FILE__) + '/../../lib/yelp4r/client'

describe Yelp4r::Client do
  include Yelp4rSpecHelper
  
  describe 'initialize' do
    before do
      @client = yelp4r_client
    end
    
    it 'sets the base_uri' do 
      @client.class.base_uri.should == 'http://api.yelp.com'
    end
    
    it 'sets default params to include the api key' do
      @client.class.default_params.should == {:ywsid => 'jprr4VyNVMGZrd-FARdSQA'}
    end
  end
  
end
