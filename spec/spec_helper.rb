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
