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
    Yelp4r::Client.new('jprr4VyNVMGZrd-FARdSQA')
  end
  
end

module Yelp4rNeighsSpecHelper  
  
  def yelp4r_test_neighs_list
    [
      {"Canada" => [
          {"Vancouver, BC" => [
              "Ambleside", "Yaletown"
            ]
          },
          "Toronto, ON"
        ]
      },
      {"USA" => [
          {"Berkeley, CA" => [
              "Claremont", "Downtown Berkeley", "East Solano Ave", "Elmwood"
            ]
          },
          {"New York, NY" => [
              {"Bronx" => [
                  "Baychester", "Bedford Park"
                ]
              },
              {"Brooklyn" => [
                  "Bath Beach", "Bay Ridge"
                ]
              },
              "Staten Island"
            ]
          },
          "Seattle, WA"
        ]
      }
    ]
  end
  
  def yelp4r_test_neighs_opts
    [
      '<option value="Canada">Canada</option>',
      '<option value="Vancouver, BC, Canada">&nbsp;-&nbsp;Vancouver, BC</option>',
      '<option value="Ambleside, Vancouver, BC, Canada">&nbsp;-&nbsp;-&nbsp;Ambleside</option>',
      '<option value="Yaletown, Vancouver, BC, Canada">&nbsp;-&nbsp;-&nbsp;Yaletown</option>',
      '<option value="Toronto, ON, Canada">&nbsp;-&nbsp;Toronto, ON</option>',
      '<option value="USA">USA</option>',
      '<option value="Berkeley, CA, USA">&nbsp;-&nbsp;Berkeley, CA</option>',
      '<option value="Claremont, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;Claremont</option>',
      '<option value="Downtown Berkeley, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;Downtown Berkeley</option>',
      '<option value="East Solano Ave, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;East Solano Ave</option>',
      '<option value="Elmwood, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;Elmwood</option>',
      '<option value="New York, NY, USA">&nbsp;-&nbsp;New York, NY</option>',
      '<option value="Bronx, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;Bronx</option>',
      '<option value="Baychester, Bronx, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Baychester</option>',
      '<option value="Bedford Park, Bronx, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Bedford Park</option>',
      '<option value="Brooklyn, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;Brooklyn</option>',
      '<option value="Bath Beach, Brooklyn, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Bath Beach</option>',
      '<option value="Bay Ridge, Brooklyn, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Bay Ridge</option>',
      '<option value="Staten Island, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;Staten Island</option>',
      '<option value="Seattle, WA, USA">&nbsp;-&nbsp;Seattle, WA</option>'
    ]
  end
  
  def yelp4r_test_neighs_opts_single_selected
    [
      '<option value="Canada">Canada</option>',
      '<option value="Vancouver, BC, Canada">&nbsp;-&nbsp;Vancouver, BC</option>',
      '<option value="Ambleside, Vancouver, BC, Canada">&nbsp;-&nbsp;-&nbsp;Ambleside</option>',
      '<option value="Yaletown, Vancouver, BC, Canada" selected="selected">&nbsp;-&nbsp;-&nbsp;Yaletown</option>',
      '<option value="Toronto, ON, Canada">&nbsp;-&nbsp;Toronto, ON</option>',
      '<option value="USA">USA</option>',
      '<option value="Berkeley, CA, USA">&nbsp;-&nbsp;Berkeley, CA</option>',
      '<option value="Claremont, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;Claremont</option>',
      '<option value="Downtown Berkeley, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;Downtown Berkeley</option>',
      '<option value="East Solano Ave, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;East Solano Ave</option>',
      '<option value="Elmwood, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;Elmwood</option>',
      '<option value="New York, NY, USA">&nbsp;-&nbsp;New York, NY</option>',
      '<option value="Bronx, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;Bronx</option>',
      '<option value="Baychester, Bronx, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Baychester</option>',
      '<option value="Bedford Park, Bronx, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Bedford Park</option>',
      '<option value="Brooklyn, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;Brooklyn</option>',
      '<option value="Bath Beach, Brooklyn, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Bath Beach</option>',
      '<option value="Bay Ridge, Brooklyn, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Bay Ridge</option>',
      '<option value="Staten Island, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;Staten Island</option>',
      '<option value="Seattle, WA, USA">&nbsp;-&nbsp;Seattle, WA</option>'
    ]
  end
  
  def yelp4r_test_neighs_opts_multiple_selected
    [
      '<option value="Canada">Canada</option>',
      '<option value="Vancouver, BC, Canada">&nbsp;-&nbsp;Vancouver, BC</option>',
      '<option value="Ambleside, Vancouver, BC, Canada">&nbsp;-&nbsp;-&nbsp;Ambleside</option>',
      '<option value="Yaletown, Vancouver, BC, Canada" selected="selected">&nbsp;-&nbsp;-&nbsp;Yaletown</option>',
      '<option value="Toronto, ON, Canada">&nbsp;-&nbsp;Toronto, ON</option>',
      '<option value="USA">USA</option>',
      '<option value="Berkeley, CA, USA">&nbsp;-&nbsp;Berkeley, CA</option>',
      '<option value="Claremont, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;Claremont</option>',
      '<option value="Downtown Berkeley, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;Downtown Berkeley</option>',
      '<option value="East Solano Ave, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;East Solano Ave</option>',
      '<option value="Elmwood, Berkeley, CA, USA">&nbsp;-&nbsp;-&nbsp;Elmwood</option>',
      '<option value="New York, NY, USA" selected="selected">&nbsp;-&nbsp;New York, NY</option>',
      '<option value="Bronx, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;Bronx</option>',
      '<option value="Baychester, Bronx, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Baychester</option>',
      '<option value="Bedford Park, Bronx, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Bedford Park</option>',
      '<option value="Brooklyn, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;Brooklyn</option>',
      '<option value="Bath Beach, Brooklyn, New York, NY, USA" selected="selected">&nbsp;-&nbsp;-&nbsp;-&nbsp;Bath Beach</option>',
      '<option value="Bay Ridge, Brooklyn, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;-&nbsp;Bay Ridge</option>',
      '<option value="Staten Island, New York, NY, USA">&nbsp;-&nbsp;-&nbsp;Staten Island</option>',
      '<option value="Seattle, WA, USA">&nbsp;-&nbsp;Seattle, WA</option>'
    ]
  end
  
end

module Yelp4rCatsSpecHelper  

  def yelp4r_test_cats_list
    [
      {"active" => {
          :display => "Active Life",
          :children => [
            {"amusementparks" => {:display => "Amusement Parks"}},
            {"fitness" => {
                :display => "Fitness & Instruction",
                :children => [
                  {"dancestudio" => {:display => "Dance Studios"}},
                  {"gyms" => {:display => "Gyms"}},
                  {"martialarts" => {:display => "Martial Arts"}}
                ]
              }
            }
          ]
        }
      },
      {"auto" => {
          :display => "Automotive",
          :children => [
            {"auto_detailing" => {:display => "Auto Detailing"}},
            {"autoglass" => {:display => "Auto Glass Services"}}
          ]
        }
      },
      {"shopping" => {
          :display => "Shopping",
          :children => [
            {"homeandgarden" => {
                :display => "Home & Garden",
                :children => [
                  {"appliances" => {:display => "Appliances"}},
                  {"furniture" => {:display => "Furniture Stores"}}
                ]
              }
            },
            {"sportgoods" => {
                :display => "Sporting Goods",
                :children => [
                  {"bikes" => {:display => "Bikes"}},
                  {"outdoorgear" => {:display => "Outdoor Gear"}},
                  {"sportswear" => {:display => "Sports Wear"}}
                ]
              }
            },
            {"thrift_stores" => {:display => "Thrift Stores"}}
          ]
        }
      }
    ]
  end
  
end
