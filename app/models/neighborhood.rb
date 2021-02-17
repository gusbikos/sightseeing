class Neighborhood < ActiveRecord::Base
  # add associatons!

  belongs_to :city 
  has_many :sites

  # def self.all_sites
  #   self.select {|site| site.city_id: 1}
  #   binding.pry
  # end
end
