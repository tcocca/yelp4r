require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/yelp4r'
require File.dirname(__FILE__) + '/../../lib/yelp4r/client'
require File.dirname(__FILE__) + '/../../lib/yelp4r/review_search'
require File.dirname(__FILE__) + '/../../lib/yelp4r/response'

describe Yelp4r::NeighborhoodSearch do
  include Yelp4rSpecHelper
  
  before do
    @client = yelp4r_client
    @review_search = Yelp4r::ReviewSearch.new(@client)
  end
    
  describe 'initialize' do
    it 'set the client' do
      @review_search.client.class.should == Yelp4r::Client
    end
  end
  
  describe 'search_by_bounding_box' do
    it 'should return results when given top left and bottom right geocodes' do
      @results = get_businesses(37.788022, -122.399797, 37.9, -122.5)
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should return the number of results requested' do
      @results = get_businesses(37.788022, -122.399797, 37.9, -122.5, :num_biz_requested => 5)
      @results.should be_success
      @results.data.should_not be_blank
      @results.data.size.should == 5
      @results.error_message.should be_blank
    end
    
    it 'should return max 20 results' do
      @results = get_businesses(37.788022, -122.399797, 37.9, -122.5, :num_biz_requested => 30)
      @results.should be_success
      @results.data.should_not be_blank
      @results.data.size.should == 20
      @results.error_message.should be_blank
    end
    
    it 'should return results when given a category term' do
      @results = get_businesses(37.788022, -122.399797, 37.9, -122.5, :term => 'bars')
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
  
    it 'should error when missing a with bad geocodes' do
      @results = get_businesses(37.788022, -122.399797, 37.9, '')
      @results.should_not be_success
      @results.data.should be_blank
      @results.error_message.should_not be_blank
    end
    
    def get_businesses(*params)
      @review_search.search_by_bounding_box(*params)
    end
  end
  
  describe 'search_by_geocode_and_radius' do
    it 'should return results when given a geocode' do
      @results = get_businesses(37.788022, -122.399797)
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should return results when given a geocode and a radius' do
      @results = get_businesses(37.788022, -122.399797, :radius => 10)
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should return the number of results requested' do
      @results = get_businesses(37.788022, -122.399797, :num_biz_requested => 5)
      @results.should be_success
      @results.data.should_not be_blank
      @results.data.size.should == 5
      @results.error_message.should be_blank
    end
    
    it 'should return max 20 results' do
      @results = get_businesses(37.788022, -122.399797, :num_biz_requested => 30)
      @results.should be_success
      @results.data.should_not be_blank
      @results.data.size.should == 20
      @results.error_message.should be_blank
    end
    
    it 'should return results when given a category term' do
      @results = get_businesses(37.788022, -122.399797, :term => 'bars')
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should error when given a bad geocode' do
      @results = get_businesses(37.788022, '')
      @results.should_not be_success
      @results.data.should be_blank
      @results.error_message.should_not be_blank
    end
  
    def get_businesses(*params)
      @review_search.search_by_geocode_and_radius(*params)
    end
  end
  
  describe 'search_by_location' do
    it 'should return results given a location' do
      @results = get_businesses('Boston, MA')
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should return the number of results requested' do
      @results = get_businesses('Boston, MA', :num_biz_requested => 5)
      @results.should be_success
      @results.data.should_not be_blank
      @results.data.size.should == 5
      @results.error_message.should be_blank
    end
    
    it 'should return max 20 results' do
      @results = get_businesses('Boston, MA', :num_biz_requested => 30)
      @results.should be_success
      @results.data.should_not be_blank
      @results.data.size.should == 20
      @results.error_message.should be_blank
    end
    
    it 'should return results when given a category term' do
      @results = get_businesses('Boston, MA', :term => 'bars')
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should return results when given a valid country code' do
      @results = get_businesses('Boston, MA', :cc => 'US')
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should error when missing a location' do
      @results = get_businesses('')
      @results.should_not be_success
      @results.data.should be_blank
      @results.error_message.should_not be_blank
    end
    
    it 'should error on invalid country code' do
      @results = get_businesses('Boston, MA', :cc => 'UK')
      @results.should_not be_success
      @results.data.should be_blank
      @results.error_message.should_not be_blank
    end
    
    def get_businesses(*params)
      @review_search.search_by_location(*params)
    end
  end
end
