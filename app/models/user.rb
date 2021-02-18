class User < ActiveRecord::Base 

    has_many :visits 
    has_many :sites, through: :visits

    # def past_visits 
    #     binding.pry
    #    Visit.all.select{ |visit| visit.visited == true && self.user.id == visit.user_id}
    #     # visits = Visit.all
    
        
    #   end

end