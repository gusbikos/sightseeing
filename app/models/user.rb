class User < ActiveRecord::Base 

    has_many :visits 
    has_many :sites, through: :visits

    def create_user 
        puts "Welcome to Sightseeing app"
        puts "Create a User Name"
        #binding.pry
    end 

end