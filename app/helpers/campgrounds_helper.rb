module CampgroundsHelper

  def found_favorite(user, campground)
    Favorite.find_by(user_id: user.id, campground_id: campground.id)
  end

  def self.states_list(term)

    states = {
      "Alabama" => "AL",
      "Alaska" => "AK",
      "Arkansas" => "AR",
      "Arizona" => "AZ",
      "California" => "CA",
      "Colorado" => "CO",
      "Connecticut" => "CT",
      "District of Columbia" => "DC",
      "Delaware" => "DE",
      "Florida" => "FL",
      "Georgia" => "GA",
      "Hawaii" => "HI",
      "Iowa" => "IA",
      "Idaho" => "ID",
      "Illinois" => "IL",
      "Indiana" => "IN",
      "Kansas" => "KS",
      "Kentucky" => "KY",
      "Louisiana" => "LA",
      "Massachusetts" => "MA",
      "Maryland" => "MD",
      "Maine" => "ME",
      "Michigan" => "MI",
      "Minnesota" => "MN",
      "Missouri" => "MO",
      "Mississippi" => "MS",
      "Montana" => "MT",
      "North Carolina" => "NC",
      "North Dakota" => "ND",
      "Nebraska" => "NE",
      "New Hampshire" => "NH",
      "New Jersey" => "NJ",
      "New Mexico" => "NM",
      "Nevada" => "NV",
      "New York" => "NY",
      "Ohio" => "OH",
      "Oklahoma" => "OK",
      "Oregon" => "OR",
      "Pennsylvania" => "PA",
      "Puerto Rico" => "PR",
      "Rhode Island" => "RI",
      "South Carolina" => "SC",
      "South Dakota" => "SD",
      "Tennessee" => "TE",
      "Texas" => "TX",
      "Utah" => "UT",
      "Virginia" => "VA",
      "Virgin Islands" => "VI",
      "Vermont" => "VT",
      "Washington" => "WA",
      "Wisconsin" => "WI",
      "West Virginia" => "WV",
      "Wyoming" => "WY"
    }

    if states.has_key?(term)
      return states[term]
    elsif states.has_value?(term.upcase)
      return term
    end

  end

end
