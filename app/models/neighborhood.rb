class Neighborhood < ActiveRecord::Base
  
  belongs_to :city 
  has_many :sites

end
