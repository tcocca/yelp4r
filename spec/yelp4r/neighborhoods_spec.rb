require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/yelp4r'

describe Yelp4r::Neighborhoods do
  include Yelp4rSpecHelper
  
  before do
    @yelp_neighs = Yelp4r::Neighborhoods.new
    @yelp_neighs.parse_url = File.dirname(__FILE__) + "/../fixtures/neighborhoods.html"
  end
  
  describe 'initialize' do
    it 'should set the url for the page to parse' do
      @yelp_neighs.parse_url.should_not be_blank
    end
  end
  
  describe 'list' do
    before do 
      @neighs = @yelp_neighs.list  
    end
    
    it "should return the list of neighborhoods" do
      @neighs.should_not be_blank
      @neighs.should == yelp4r_test_neighs_list
    end
  end
  
end
