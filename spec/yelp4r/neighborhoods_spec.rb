require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/yelp4r'

describe Yelp4r::Neighborhoods do
  include Yelp4rSpecHelper
  include Yelp4rNeighsSpecHelper
  
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
  
  describe 'options_from_collection' do
    it "should return an array of options" do
      @yelp_neighs.options_from_list.should_not be_blank
      @yelp_neighs.options_from_list.should == yelp4r_test_neighs_opts
    end
    
    it "should return an array of options with a single selected value when given a string" do
      @opts = @yelp_neighs.options_from_list("Yaletown, Vancouver, BC, Canada")
      @opts.should_not be_blank
      @opts.should == yelp4r_test_neighs_opts_single_selected
    end
    
    it "should return an array of options with multiple selected values when given a array" do
      @opts = @yelp_neighs.options_from_list([
        "Yaletown, Vancouver, BC, Canada", 
        "New York, NY, USA", 
        "Bath Beach, Brooklyn, New York, NY, USA"
      ])
      @opts.should_not be_blank
      @opts.should == yelp4r_test_neighs_opts_multiple_selected
    end
  end
  
end
