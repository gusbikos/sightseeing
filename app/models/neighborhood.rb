class Neighborhood < ActiveRecord::Base
  # add associatons!

  belongs_to :city 
  has_many :sites
end
