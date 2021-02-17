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
        menu.choice "New York City", -> { new_york_hoods}
        menu.choice "Chicago", -> { chicago_hoods }
        menu.choice "Back to Welcome Screen", -> { welcome }
      end
    end
      
    def new_york_hoods
      prompt.select("What neighborhood would you like to visit?") do |menu| 
        menu.choice "Brooklyn", -> { ny_sites }
        menu.choice "Queens", -> { ny_sites }
        menu.choice "Manhattan", -> { ny_sites }
        menu.choice "Go back", -> { main_screen }
        #change these method names to all be the same
      end 
    end

    def chicago_hoods 
      prompt.select("What neighborhood would you like to visit?") do |menu| 
        menu.choice "North Side", -> { chi_sites }
        menu.choice "West Side", -> { chi_sites }
        menu.choice "South Side", -> { chi_sites }
        menu.choice "The Loop", -> { chi_sites }
        menu.choice "Go back", -> { main_screen }
        #change these method names to all be the same
      end 
    end

    def ny_sites
      #binding.pry
      # new_york_hoods.find_by(city_id: 1)
      site = Site.all.select {|site| site.neighborhood.city_id == 1}
      prompt.select("Which site would you like to visit?", site)
    end
    

    def chi_sites 
      site = Site.all.select {|site| site.neighborhood.city_id == 2} 
      prompt.select("Which site would you like to visit?", site)
    end

    
      


    def exit_helper 
      puts "Good Bye"
    end



      








  

  private

  
end
