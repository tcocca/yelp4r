require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../lib/yelp4r'
require File.dirname(__FILE__) + '/../../lib/yelp4r/client'
require File.dirname(__FILE__) + '/../../lib/yelp4r/neighborhood_search'
require File.dirname(__FILE__) + '/../../lib/yelp4r/response'

describe Yelp4r::NeighborhoodSearch do
  include Yelp4rSpecHelper
  
  before do
    @client = yelp4r_client
    @neighborhood_search = Yelp4r::NeighborhoodSearch.new(@client)
  end
    
  describe 'initialize' do    
    it 'set the client' do 
      @neighborhood_search.client.class.should == Yelp4r::Client
    end
  end
  
  describe 'search_by_geocode' do
    it 'should return results when passed a lat lon' do
      @results = get_neighborhoods(42.3500, -71.0780)
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should not return results when given invalid params' do
      @results = get_neighborhoods(42.3500, '')
      @results.should_not be_success
      @results.data.should be_blank
      @results.error_message.should_not be_blank
    end
    
    def get_neighborhoods(*params)
      @neighborhood_search.search_by_geocode(*params)
    end
  end
  
  describe 'search_by_location' do
    it 'should return results when given a location' do
      @results = get_neighborhoods('1512 Shattuck Ave., Berkely, CA')
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should return results when given a location and a country code' do
      @results = get_neighborhoods('1512 Shattuck Ave., Berkely, CA', 'US')
      @results.should be_success
      @results.data.should_not be_blank
      @results.error_message.should be_blank
    end
    
    it 'should error when given an invalid country code' do
      @results = get_neighborhoods('Berkely, CA', 'UK')
      @results.should_not be_success
      @results.data.should be_blank
      @results.error_message.should_not be_blank
    end
    
    it 'should error when missing a location' do
      @results = get_neighborhoods('')
      @results.should_not be_success
      @results.data.should be_blank
      @results.error_message.should_not be_blank
    end
    
    it 'should error when given an invalid params' do
      @results = get_neighborhoods('', 'US')
      @results.should_not be_success
      @results.data.should be_blank
      @results.error_message.should_not be_blank
    end
    
    def get_neighborhoods(*params)
      @neighborhood_search.search_by_location(*params)
    end
  end
  
end
