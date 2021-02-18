class Site < ActiveRecord::Base

  belongs_to :neighborhood
  has_many :visits
  has_many :users, through: :visits 

  def to_s
    self.name
  end

end
