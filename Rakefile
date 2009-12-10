require 'rake'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "yelp4r"
    s.summary = %Q{Yelp API wrapper in Ruby}
    s.email = "tom.cocca@gmail.com"
    s.homepage = "http://github.com/tcocca/yelp4r"
    s.description = "Simple Ruby wrapper for the Yelp API built on HTTParty with parsers for available Neighborhoods and Categories"
    s.files = [
      "README",
      "LICENSE",
      "Rakefile",
      "VERSION.yml",
      "lib/yelp4r.rb",
      "lib/rubyify_keys.rb",
      "lib/yelp4r/categories.rb",
      "lib/yelp4r/client.rb",
      "lib/yelp4r/neighborhood_search.rb",
      "lib/yelp4r/neighborhoods.rb",
      "lib/yelp4r/phone_search.rb",
      "lib/yelp4r/response.rb",
      "lib/yelp4r/review_search.rb",
      "spec/rcov.opts",
      "spec/spec.opts",
      "spec/spec_helper.rb",
      "spec/fixtures/categories.html",
      "spec/fixtures/neighborhoods.html",
      "spec/yelp4r/categories_spec.rb",
      "spec/yelp4r/client_spec.rb",
      "spec/yelp4r/neighborhood_search_spec.rb",
      "spec/yelp4r/neighborhoods_spec.rb",
      "spec/yelp4r/phone_search_spec.rb",
      "spec/yelp4r/review_search_spec.rb",
      "examples/yelp.rb"
    ]
    s.authors = ["Tom Cocca"]
    s.add_dependency 'httparty'
    s.add_dependency 'nokogiri'
    s.add_dependency 'mash'
    s.add_development_dependency "rspec"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'yelp4r'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Dir['tasks/**/*.rake'].each { |t| load t }

task :default => :spec
