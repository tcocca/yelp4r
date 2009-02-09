require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/yelp4r'

describe Yelp4r::Categories do
  include Yelp4rSpecHelper
  
  before do
    @yelp_cats = Yelp4r::Categories.new
    @yelp_cats.parse_url = File.dirname(__FILE__) + "/../fixtures/categories.html"
  end
  
  describe 'initialize' do
    it 'should set the url for the page to parse' do
      @yelp_cats.parse_url.should_not be_blank
    end
  end
  
  describe 'list' do
    before do 
      @cats = @yelp_cats.list  
    end
    
    it "should return the list of categies" do
      @cats.should_not be_blank
      @cats.should == yelp4r_test_cats_list
    end
  end
  
end
