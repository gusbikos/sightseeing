# Sightseeing Seeds

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

#City
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

#NEW_YORK - MANHATTAN
statue_of_liberty = Site.create(name: "Statue Of Liberty", address: Rainbow("Liberty Island").hotpink, description: " ",neighborhood_id: manhattan.id) 

msg = Site.create(name: "Madison Square Garden", address: Rainbow("4 Penn Plaza").hotpink, description: "The Worlds Most Famous Arena",neighborhood_id: manhattan.id)

empire_state = Site.create(name: "Empire State Building", address: Rainbow("20 West 34th St").hotpink, description: "Built in 1931, stands 102 stories tall, and was the worlds tallest building until 1971", neighborhood_id: manhattan.id)

#NEW_YORK - BROOKLYN
coney_island = Site.create(name: "Coney Island", address: Rainbow("Surf Avenue").hotpink, description: "Amusement Park and Beach",neighborhood_id: brooklyn.id)

barclays = Site.create(name: "Barclays Center", address: Rainbow("620 Atlantic Avenue").hotpink, description: "Home of the Brooklyn Nets",neighborhood_id: brooklyn.id)

prospect_park = Site.create(name: "Prospect Park Zoo", address: Rainbow("450 Flatbush Avenue").hotpink, description: "12 acre zoo located in Prospect Park", neighborhood_id: brooklyn.id)

#NEW_YORK - QUEENS
citi_field = Site.create(name: "Citi field", address: Rainbow("41 Seaver Way").hotpink, description: "Home of the New York Mets",neighborhood_id: queens.id)

flushing_meadows_park = Site.create(name: "Flushing Meadows Park", address: Rainbow("Between Grand Central Parkway and Van Wyck Expressway").hotpink, description: "Hosted the 1964 Worlds Fair",neighborhood_id: queens.id)

hall_of_science = Site.create(name: "New York Hall of Science", address: Rainbow("47-01 111th st").hotpink, description: "Interactive Science Museum",neighborhood_id: queens.id)


#CHICAGO - NORTH SIDE
wrigley_field = Site.create(name: "Wrigley Field", address: Rainbow("1060 W Addison St").hotpink, description: "Home of the Chicago Cubs", neighborhood_id: north_side.id)

lincoln_park_zoo = Site.create(name: "Lincoln Park Zoo", address: Rainbow("2001 N Clark St").hotpink, description: "Founded in 1868, one of the few admission free zoos in the United States.", neighborhood_id: north_side.id)

chicago_botanic_garden = Site.create(name: "Chicago Botanic Garden", address: Rainbow("1000 Lake Cook Rd").hotpink, description: "385 acres of landscaped gardens displaying millions of plants & flowers in a variety of settings.", neighborhood_id: north_side.id)

#CHICAGO - SOUTH SIDE
guaranteed_rate_field = Site.create(name: "Guaranteed Rate Field", address: Rainbow("333 W 35th St").hotpink, description: "Home ballpark of the Chicago White Sox", neighborhood_id: south_side.id)

chinatown = Site.create(name: "Chinatown (Chicago)", address: Rainbow("Cermak Road and Wentworth Avenue").hotpink, description: "Stroll through elaborately adorned streets filled with authentic grocery stores, boutiques, souvenir shops, and family-owned restaurants.", neighborhood_id: south_side.id)

stony_island_arts_bank = Site.create(name: "Stony Island Arts Bank", address: Rainbow("6760 S Stony Island Ave").hotpink, description: "A space for neighborhood residents to preserve, access, reimagine and share their heritage – and a destination for artists, scholars, curators, and collectors to research and engage with South Side history.", neighborhood_id: south_side.id)

#CHICAGO - WEST SIDE
garfield_park_conservatory = Site.create(name: "Garfield Park Conservatory", address: Rainbow("300 N Central Park Ave").hotpink, description: "One of the largest and most stunning botanical conservatories in the nation.", neighborhood_id: west_side.id)

logan_square_monument = Site.create(name: "Logan Square Monument", address: Rainbow("Milwaukee Avenue and Logan Boulevard").hotpink, description: "A public monument built in 1918 to celebrate the 100th anniversary of Illinois' statehood.", neighborhood_id: west_side.id)

humboldt_park = Site.create(name: "Humboldt Park (Chicago park)", address: Rainbow("1440 N. Humboldt Boulevard").hotpink, description: "In the heart of the Humboldt Park Community, Humboldt Park totals 197.26 acres and is home to a large, historic fieldhouse.", neighborhood_id: west_side.id)

#CHICAGO - THE LOOP
willis_tower = Site.create(name: "Willis Tower", address: Rainbow("233 S Wacker Dr").hotpink, description: "A 108-story, 1,450-foot skyscraper in Chicago.", neighborhood_id: the_loop.id)

field_museum = Site.create(name: "Field Museum", address: Rainbow("1400 S Lake Shore Dr").hotpink, description: "The Field Museum, is a natural history museum in Chicago, Illinois.", neighborhood_id: the_loop.id)

art_institute = Site.create(name: "The Art Institute of Chicago", address: Rainbow("111 S Michigan Ave").hotpink, description: "The Art Institute of Chicago in Chicago's Grant Park, founded in 1879, is one of the oldest and largest art museums in the United States.", neighborhood_id: the_loop.id)


#U in our CRUD
Site.all.each do |site|
    wiki_desc = Wikipedia.find( site.name )
    site.update(description: Rainbow(wiki_desc.summary.wrap).goldenrod)
   
end 

puts "🔥 🔥 🔥 🔥 "

