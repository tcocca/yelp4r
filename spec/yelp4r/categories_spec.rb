require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/yelp4r'

describe Yelp4r::Categories do
  include Yelp4rSpecHelper
  include Yelp4rCatsSpecHelper
  
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
  
  describe 'options_from_list' do
    it "should return an array of options" do
      @yelp_cats.options_from_list.should_not be_blank
      @yelp_cats.options_from_list.should == yelp4r_test_cats_opts
    end
    
    it "should return an array of options with a single selected value when given a string" do
      @opts = @yelp_cats.options_from_list("gyms")
      @opts.should_not be_blank
      @opts.should == yelp4r_test_cats_opts_single_selected
    end
    
    it "should return an array of options with multiple selected values when given a array" do
      @opts = @yelp_cats.options_from_list(["gyms", "autoglass", "appliances"])
      @opts.should_not be_blank
      @opts.should == yelp4r_test_cats_opts_multiple_selected
    end
  end
  
end
