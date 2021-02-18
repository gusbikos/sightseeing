# THIS SEED FILE NEEDS TO BE ENTIRELY REPLACED -- I'M LEAVING CODE FOR YOUR REFERENCE ONLY!

City.destroy_all
Neighborhood.destroy_all
Site.destroy_all
User.destroy_all
Visit.destroy_all
City.reset_pk_sequence
Neighborhood.reset_pk_sequence
Site.reset_pk_sequence
User.reset_pk_sequence
Visit.reset_pk_sequence

########### different ways to write your seeds ############

# 1: save everything to variables (makes it easy to connect models, best for when you want to be intentional about your seeds)
# basil = Plant.create(name: "basil the herb", bought: 20200610, color: "green")
# sylwia = Person.create(name: "Sylwia", free_time: "none", age: 30)
# pp1 = PlantParenthood.create(plant_id: basil.id, person_id: sylwia.id, affection: 1_000_000, favorite?: true)

new_york = City.create(name: "New York")
chicago = City.create(name: "Chicago")

#NEW YORK
manhattan = Neighborhood.create(name: "Manhattan", city_id: new_york.id)
brooklyn = Neighborhood.create(name: "Brooklyn", city_id: new_york.id)
queens = Neighborhood.create(name: "Queens", city_id: new_york.id)

#CHICAGO
north_side = Neighborhood.create(name: "North Side", city_id: chicago.id)
south_side = Neighborhood.create(name: "South Side", city_id: chicago.id)
west_side = Neighborhood.create(name: "West Side", city_id: chicago.id)
the_loop = Neighborhood.create(name: "The Loop", city_id: chicago.id)

#page = Wikipedia.find( 'Statue of Liberty' )

#NEW_YORK - MANHATTAN
statue_of_liberty = Site.create(name: "Statue Of Liberty", address: "Liberty Island", description: " ",neighborhood_id: manhattan.id) 

msg = Site.create(name: "Madison Square Garden", address: "4 Penn Plaza", description: "The Worlds Most Famous Arena",neighborhood_id: manhattan.id)

empire_state = Site.create(name: "Empire State Building", address: "20 West 34th St", description: "Built in 1931, stands 102 stories tall, and was the worlds tallest building until 1971", neighborhood_id: manhattan.id)

#NEW_YORK - BROOKLYN
coney_island = Site.create(name: "Coney Island", address: "Surf Avenue", description: "Amusement Park and Beach",neighborhood_id: brooklyn.id)

barclays = Site.create(name: "Barclays Center", address: "620 Atlantic Avenue", description: "Home of the Brooklyn Nets",neighborhood_id: brooklyn.id)

prospect_park = Site.create(name: "Prospect Park Zoo", address: "450 Flatbush Avenue", description: "12 acre zoo located in Prospect Park", neighborhood_id: brooklyn.id)

#NEW_YORK - QUEENS
citi_field = Site.create(name: "Citi field", address: "41 Seaver Way", description: "Home of the New York Mets",neighborhood_id: queens.id)

flushing_meadows_park = Site.create(name: "Flushing Meadows Park", address: "Between Grand Central Parkway and Van Wyck Expressway", description: "Hosted the 1964 Worlds Fair",neighborhood_id: queens.id)

hall_of_science = Site.create(name: "New York Hall of Science", address: "47-01 111th st", description: "Interactive Science Museum",neighborhood_id: queens.id)


#CHICAGO - NORTH SIDE
wrigley_field = Site.create(name: "Wrigley Field", address: "1060 W Addison St", description: "Home of the Chicago Cubs", neighborhood_id: north_side.id)

lincoln_park_zoo = Site.create(name: "Lincoln Park Zoo", address: "2001 N Clark St", description: "Founded in 1868, one of the few admission free zoos in the United States.", neighborhood_id: north_side.id)

chicago_botanic_garden = Site.create(name: "Chicago Botanic Garden", address: "1000 Lake Cook Rd", description: "385 acres of landscaped gardens displaying millions of plants & flowers in a variety of settings.", neighborhood_id: north_side.id)

#CHICAGO - SOUTH SIDE
guaranteed_rate_field = Site.create(name: "Guaranteed Rate Field", address: "333 W 35th St", description: "Home ballpark of the Chicago White Sox", neighborhood_id: south_side.id)

chinatown = Site.create(name: "Chinatown", address: "Cermak Road and Wentworth Avenue", description: "Stroll through elaborately adorned streets filled with authentic grocery stores, boutiques, souvenir shops, and family-owned restaurants.", neighborhood_id: south_side.id)

stony_island_arts_bank = Site.create(name: "Stony Island Arts Bank", address: "6760 S Stony Island Ave", description: "A space for neighborhood residents to preserve, access, reimagine and share their heritage – and a destination for artists, scholars, curators, and collectors to research and engage with South Side history.", neighborhood_id: south_side.id)

#CHICAGO - WEST SIDE
garfield_park_conservatory = Site.create(name: "Garfield Park Conservatory", address: "300 N Central Park Ave", description: "One of the largest and most stunning botanical conservatories in the nation.", neighborhood_id: west_side.id)

logan_square_monument = Site.create(name: "Logan Square Monument", address: "Milwaukee Avenue and Logan Boulevard", description: "A public monument built in 1918 to celebrate the 100th anniversary of Illinois' statehood.", neighborhood_id: west_side.id)

humboldt_park = Site.create(name: "Humboldt Park", address: "1440 N. Humboldt Boulevard", description: "In the heart of the Humboldt Park Community, Humboldt Park totals 197.26 acres and is home to a large, historic fieldhouse.", neighborhood_id: west_side.id)

#CHICAGO - THE LOOP
willis_tower = Site.create(name: "Willis Tower", address: "233 S Wacker Dr", description: "A 108-story, 1,450-foot skyscraper in Chicago.", neighborhood_id: the_loop.id)

field_museum = Site.create(name: "Field Museum", address: "1400 S Lake Shore Dr", description: "The Field Museum, is a natural history museum in Chicago, Illinois.", neighborhood_id: the_loop.id)

art_institute = Site.create(name: "The Art Institute of Chicago", address: "111 S Michigan Ave", description: "The Art Institute of Chicago in Chicago's Grant Park, founded in 1879, is one of the oldest and largest art museums in the United States.", neighborhood_id: the_loop.id)


#U in our CRUD
Site.all.each do |site|
    wiki_desc = Wikipedia.find( site.name )
    site.update(description: wiki_desc.summary.wrap)
   
end 


# 2. Mass create -- in order to connect them later IN SEEDS (not through the app) you'll need to find their id
## a. by passing an array of hashes:
# Plant.create([
#     {name: "Corn Tree", bought: 20170203, color: "green"},
#     {name: "Prayer plant", bought: 20190815, color: "purple"},
#     {name: "Cactus", bought: 20200110, color: "ugly green"}
# ])
# ## b. by interating over an array of hashes:
# plants = [{name: "Elephant bush", bought: 20180908, color: "green"},
#     {name: "Photos", bought: 20170910, color: "green"},
#     {name: "Dragon tree", bought: 20170910, color: "green"},
#     {name: "Snake plant", bought: 20170910, color: "dark green"},
#     {name: "polka dot plant", bought: 20170915, color: "pink and green"},
#     {name: "Cactus", bought: 20200517, color: "green"}]

# plants.each{|hash| Plant.create(hash)}

# # 3. Use Faker and mass create
# ## step 1: write a method that creates a person
# def create_person
#     free = ["mornings", "evenings", "always", "afternoons", "weekends", "none"].sample

#     person = Person.create(
#         name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
#         free_time: free,
#         age: rand(11...70)
#     )
# end

# ## step 2: write a method that creates a joiner
# def create_joiners(person)
#     plants_number = rand(1..4)
#     plants_number.times do 
#         PlantParenthood.create(
#             plant_id: Plant.all.sample.id, 
#             person_id: person.id, 
#             affection: rand(101), 
#             favorite?: [true, false].sample
#         )
#     end
# end

# ## step 3: invoke creating joiners by passing in an instance of a person
# 10.times do     
#     create_joiners(create_person)
#     ##### ALTERNATIVE:
#     # person = create_person
#     # create_joiners(person)
# end

# indoor = Category.create(name: "indoors")

# Plant.update(category_id: indoor.id)


puts "🔥 🔥 🔥 🔥 "

#binding.pry 
#0