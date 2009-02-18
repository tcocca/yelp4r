# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yelp4r}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Cocca"]
  s.date = %q{2009-02-17}
  s.description = %q{Simple Ruby wrapper for the Yelp API built on HTTParty with parsers for available Neighborhoods and Categories}
  s.email = %q{tom.cocca@gmail.com}
  s.files = ["README", "LICENSE", "Rakefile", "VERSION.yml", "lib/yelp4r.rb", "lib/yelp4r/categories.rb", "lib/yelp4r/client.rb", "lib/yelp4r/neighborhood_search.rb", "lib/yelp4r/neighborhoods.rb", "lib/yelp4r/phone_search.rb", "lib/yelp4r/response.rb", "lib/yelp4r/review_search.rb", "spec/rcov.opts", "spec/spec.opts", "spec/spec_helper.rb", "spec/fixtures/categories.html", "spec/fixtures/neighborhoods.html", "spec/yelp4r/categories_spec.rb", "spec/yelp4r/client_spec.rb", "spec/yelp4r/neighborhood_search_spec.rb", "spec/yelp4r/neighborhoods_spec.rb", "spec/yelp4r/phone_search_spec.rb", "spec/yelp4r/review_search_spec.rb", "examples/yelp.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/tcocca/yelp4r}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Yelp API wrapper in Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<hpricot>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<hpricot>, [">= 0"])
  end
end
