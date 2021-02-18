class Visit < ActiveRecord::Base 

    belongs_to :site 
    belongs_to :user

    def to_s 
        self.visits
    end

    

end