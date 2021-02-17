class Sightseeing
  # here will be your CLI!
  # it is not an AR class so you need to add attr

  attr_reader :prompt
  attr_accessor :user, :delete_user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome 
      puts "Welcome to our Sightseeing App"
      #binding.pry
      prompt.select("Main menu") do |menu| 
        menu.choice "Sign up", -> {sign_up_helper}
        menu.choice "Login", -> {login_helper}
        menu.choice "Exit", -> {exit_helper}
      end
    end

    def exit_helper 
      #binding.pry
      puts "Good Bye"
      exit
    end

    def sign_up_helper 
      name = prompt.ask("What is your username?")
        while User.find_by(name: name)
            puts "This username is already taken"
            name = prompt.ask("What is your username?")
        end 
        self.user = User.create(name: name)
        puts "Hello #{user.name}"
        sleep(1.5)
        main_screen
    end

    def login_helper 
      name = prompt.ask("What is your username?")
      self.user = User.find_by(name: name)
     
      while User.find_by(name: name) 
        
        puts "Welcome #{name}"
        account_management 
        
      end
      puts "That username does not exist"

      prompt.select("Would you like to try again?") do |menu| 
        menu.choice "Yes", -> {sign_up_helper}
        menu.choice "No", -> {exit_helper}
        #exit_helper
      end
      #exit_helper
      #@delete_user = self.user 
       
    end

    def account_management
      puts "Manage account"
      #binding.pry
      prompt.select("Account Management") do |menu| 
        menu.choice "Update Username", -> { sign_up_helper }
        menu.choice "Sites Visited", -> { login_helper }
        menu.choice "Delete Account", -> { delete_account }
        menu.choice "Continue", -> { main_screen }
        menu.choice "Exit", -> { exit_helper } #leave_account_management, #exit_helper
         
      end
    end

    def delete_account
      #binding.pry
      #self.user = User.delete
      #@delete_user = self.user.delete
      #self.user.delete
      self.user.delete
      puts "You Account Has Been Deleted"
      welcome
    end

    def main_screen 
      system 'clear'
      user.reload
      sleep(0.5)
      prompt.select("What city are you visiting?") do |menu| 
        menu.choice "New York City", -> { new_york_hoods }
        menu.choice "Chicago", -> { chicago_hoods }
        menu.choice "Back to Welcome Screen", -> { welcome }
      end
    end

    # def chosen_neighborhood(city)
    #   @chosen_city = City.find_by(name: city)
    #   chosen_site = prompt.select("What site would you like to visit?", chosen_hood.sites)
    #   prompt.select("What neighborhood would you like to visit?") do |menu| 
    #     menu.choice "Brooklyn", -> { chosen_sites("Brooklyn") }
    #     menu.choice "Queens", -> { chosen_sites("Queens") }
    #     menu.choice "Manhattan", -> { chosen_sites("Manhattan") }
    #     menu.choice "North Side", -> { chosen_sites("North Side") }
    #     menu.choice "West Side", -> { chosen_sites("West Side") }
    #     menu.choice "South Side", -> { chosen_sites("South Side") }
    #     menu.choice "The Loop", -> { chosen_sites("The Loop") }
    #     menu.choice "Go back", -> { main_screen }
    #   end 
    # end 
      
    def new_york_hoods
      prompt.select("What neighborhood would you like to visit?") do |menu| 
        menu.choice "Brooklyn", -> { chosen_sites("Brooklyn") }
        menu.choice "Queens", -> { chosen_sites("Queens") }
        menu.choice "Manhattan", -> { chosen_sites("Manhattan") }
        menu.choice "Go back", -> { main_screen }
        #change these method names to all be the same
      end 
    end

    def chicago_hoods 
      prompt.select("What neighborhood would you like to visit?") do |menu| 
        menu.choice "North Side", -> { chosen_sites("North Side") }
        menu.choice "West Side", -> { chosen_sites("West Side") }
        menu.choice "South Side", -> { chosen_sites("South Side") }
        menu.choice "The Loop", -> { chosen_sites("The Loop") }
        menu.choice "Go back", -> { main_screen }
        #change these method names to all be the same
      end 
    end

    def chosen_sites(neighborhood)
      # binding.pry 
      chosen_hood = Neighborhood.find_by(name: neighborhood)
      chosen_site = prompt.select("What site would you like to visit?", chosen_hood.sites)
      Visit.create(user_id: user.id, site_id: chosen_site.id, visited: true)
      puts chosen_site.name 
      puts chosen_site.address
      puts chosen_site.description
      
      prompt.select("\n""Where to go from here?") do |menu| 
        # menu.choice "Go Back", -> {  }
        menu.choice "Change City", -> { main_screen }
        menu.choice "Log Out", -> { exit_helper }
      end
    
    end

    def leave_account_management 
      puts "Goodbye"
    end



    

      








  

  private

  
end
