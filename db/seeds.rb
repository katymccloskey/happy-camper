states = Array[ ["AK", "Alaska"],
["AL", "Alabama"],
["AR", "Arkansas"],
["AS", "American Samoa"],
["AZ", "Arizona"],
["CA", "California"],
["CO", "Colorado"],
["CT", "Connecticut"],
["DC", "District of Columbia"],
["DE", "Delaware"],
["FL", "Florida"],
["GA", "Georgia"],
["GU", "Guam"],
["HI", "Hawaii"],
["IA", "Iowa"],
["ID", "Idaho"],
["IL", "Illinois"],
["IN", "Indiana"],
["KS", "Kansas"],
["KY", "Kentucky"],
["LA", "Louisiana"],
["MA", "Massachusetts"],
["MD", "Maryland"],
["ME", "Maine"],
["MI", "Michigan"],
["MN", "Minnesota"],
["MO", "Missouri"],
["MS", "Mississippi"],
["MT", "Montana"],
["NC", "North Carolina"],
["ND", "North Dakota"],
["NE", "Nebraska"],
["NH", "New Hampshire"],
["NJ", "New Jersey"],
["NM", "New Mexico"],
["NV", "Nevada"],
["NY", "New York"],
["OH", "Ohio"],
["OK", "Oklahoma"],
["OR", "Oregon"],
["PA", "Pennsylvania"],
["PR", "Puerto Rico"],
["RI", "Rhode Island"],
["SC", "South Carolina"],
["SD", "South Dakota"],
["TN", "Tennessee"],
["TX", "Texas"],
["UT", "Utah"],
["VA", "Virginia"],
["VI", "Virgin Islands"],
["VT", "Vermont"],
["WA", "Washington"],
["WI", "Wisconsin"],
["WV", "West Virginia"],
["WY", "Wyoming"] ]

states.each do |state|
  campgrounds = Supercamp.campgrounds.state(state[0])
  if campgrounds.count != 0
    puts "found #{campgrounds.count} campgrounds in #{state[1]}!"
    sleep 2
    campgrounds.results.each do |camp|
      if camp[:facility_name] != nil || camp[:state] != nil
        Campground.find_or_create_by(name: camp[:facility_name].downcase.titleize, state: camp[:state],
          picture: "http://www.reserveamerica.com#{camp[:facilty_photo]}", contract_id: camp[:contract_id],
         facility_id: camp[:facility_id], latitude: camp[:latitude], longitude: camp[:longitude], amps: camp[:sites_with_amps],
         pets: camp[:sites_with_pets_allowed], sewage: camp[:sites_with_sewer_hookup], water: camp[:sites_with_water_hookup])
      end
    end
  else
    puts "No campgrounds in #{state[1]}."
    sleep 2
  end
end
