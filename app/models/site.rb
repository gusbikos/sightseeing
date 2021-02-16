class Site < ActiveRecord::Base
  # add associatons!

  belongs_to :neighborhood
  has_many :visits
  has_many :users, through: :visits 

end
