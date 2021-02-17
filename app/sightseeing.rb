class Sightseeing
  # here will be your CLI!
  # it is not an AR class so you need to add attr

  attr_reader :prompt
  attr_accessor :user 

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome 
      puts "Welcome to our Sightseeing App"
      prompt.select("Main menu") do |menu| 
        menu.choice "Sign up", -> {sign_up_helper}
        menu.choice "Login", -> {login_helper}
        menu.choice "Exit", -> {exit_helper}
      end
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
      main_screen 
    end

    def main_screen 
      system 'clear'
      user.reload
      sleep(0.5)
      prompt.select("What city are you visiting?") do |menu| 
        menu.choice "New York City", -> { chosen_neighborhood("New York City")}
        menu.choice "Chicago", -> { chosen_neighborhood("Chicago") }
        menu.choice "Back to Welcome Screen", -> { welcome }
      end
    end

    def chosen_neighborhood(city)
      chosen_city = City.find_by(name: city)
      # chosen_site = prompt.select("What site would you like to visit?", chosen_hood.sites)
      prompt.select("What neighborhood would you like to visit?") do |menu| 
        menu.choice "Brooklyn", -> { chosen_sites("Brooklyn") }
        menu.choice "Queens", -> { chosen_sites("Queens") }
        menu.choice "Manhattan", -> { chosen_sites("Manhattan") }
        menu.choice "North Side", -> { chosen_sites("North Side") }
        menu.choice "West Side", -> { chosen_sites("West Side") }
        menu.choice "South Side", -> { chosen_sites("South Side") }
        menu.choice "The Loop", -> { chosen_sites("The Loop") }
        menu.choice "Go back", -> { main_screen }
      end 
    end 
      
    # def new_york_hoods
    #   prompt.select("What neighborhood would you like to visit?") do |menu| 
    #     menu.choice "Brooklyn", -> { chosen_sites("Brooklyn") }
    #     menu.choice "Queens", -> { chosen_sites("Queens") }
    #     menu.choice "Manhattan", -> { chosen_sites("Manhattan") }
    #     menu.choice "Go back", -> { main_screen }
    #     #change these method names to all be the same
    #   end 
    # end

    # def chicago_hoods 
    #   prompt.select("What neighborhood would you like to visit?") do |menu| 
    #     menu.choice "North Side", -> { chosen_sites("North Side") }
    #     menu.choice "West Side", -> { chosen_sites("West Side") }
    #     menu.choice "South Side", -> { chosen_sites("South Side") }
    #     menu.choice "The Loop", -> { chosen_sites("The Loop") }
    #     menu.choice "Go back", -> { main_screen }
    #     #change these method names to all be the same
    #   end 
    # end

def chosen_sites(neighborhood)
      # binding.pry 
      chosen_hood = Neighborhood.find_by(name: neighborhood)
      chosen_site = prompt.select("What site would you like to visit?", chosen_hood.sites)
      Visit.create(user_id: user.id, site_id: chosen_site.id, visited: true)
      puts chosen_site.name 
      puts chosen_site.address
      puts chosen_site.description
      
      prompt.select("\n""Where to go from here?") do |menu| 
        menu.choice "Go Back", -> { chosen_neighborhood(chosen_site.neighborhood.city.name) }
        menu.choice "Change City", -> { main_screen }
        menu.choice "Log Out", -> { exit_helper }
      end
    
    end





    def exit_helper 
      puts "Good Bye"
    end



      








  

  private

  
end
