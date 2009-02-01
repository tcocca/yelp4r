begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'yelp4r'

module Yelp4rSpecHelper
  
  def yelp4r_client
    Yelp4r::Client.new(ENV['ywsid'])
  end
  
end
