class Campground < ApplicationRecord

  GOOGLE_CLIENT = GooglePlaces::Client.new(ENV['GOOGLE_MAP_KEY'])

  validates :name, uniqueness: true
  has_many :favorites
  has_many :users, through: :favorites
  has_many :cg_amenities
  has_many :amenities, through: :cg_amenities
  has_one :detail

  def google_photos
   @spots = GOOGLE_CLIENT.spots(self.latitude, self.longitude, name: self.name)
   @spot = @spots[0]
   if !@spot.nil?
    if !@spot.photos[0].nil?
     @url = @spot.photos[0].fetch_url(400)
   end
 end

end

def find_amenity_accessible
  self.amenities.select do |amenity|
   amenity.name if amenity.name.downcase.include? "accessible"
 end.map{|item| item.name}
end

def find_amenity_fire
  self.amenities.select do |amenity|
    if !amenity.name.downcase.include?("accessible")
     amenity.name if
     amenity.name.downcase.include?("campfire") ||
     amenity.name.downcase.include?("fire") ||
     amenity.name.downcase.include?("firewood") ||
     amenity.name.downcase.include?("log")
   end
 end.map{|item| item.name}
end

def find_amenity_water
  self.amenities.select do |amenity|
    if !amenity.name.downcase.include?("accessible")
     amenity.name if
     amenity.name.downcase.include?("water") ||
     amenity.name.downcase.include?("pump") ||
     amenity.name.downcase.include?("toilet") ||
     amenity.name.downcase.include?("drinking") ||
     amenity.name.downcase.include?("sink")
   end
 end.map{|item| item.name}
end

def find_amenity_fun
  self.amenities.select do |amenity|
    if !amenity.name.downcase.include?("accessible")
     amenity.name if
     amenity.name.downcase.include?("horse") ||
     amenity.name.downcase.include?("bike") ||
     amenity.name.downcase.include?("kayak") ||
     amenity.name.downcase.include?("boat") ||
     amenity.name.downcase.include?("bird") ||
     amenity.name.downcase.include?("view") ||
     amenity.name.downcase.include?("rafting") ||
     amenity.name.downcase.include?("theater") ||
     amenity.name.downcase.include?("fishing") ||
     amenity.name.downcase.include?("lake")
   end
 end.map{|item| item.name}
end

def find_amenity_general
  self.amenities.select do |amenity|
    if !amenity.name.downcase.include?("accessible")
      amenity.name if
      amenity.name.downcase.include?("office") ||
      amenity.name.downcase.include?("otel") ||
      amenity.name.downcase.include?("store") ||
      amenity.name.downcase.include?("shop") ||
      amenity.name.downcase.include?("grocery") ||
      amenity.name.downcase.include?("cafe") ||
      amenity.name.downcase.include?("visitor")
    end
  end.map{|item| item.name}
end

def self.search(term)
  if term
      term = term.titleize
      state = CampgroundsHelper::states_list(term)

      if state
         @campgrounds = Campground.where('state ILIKE ?', "%#{state}%")

      else
         @campgrounds = Campground.where('name ILIKE ?', "%#{term}%")
      end


      if @campgrounds.empty?
        @campgrounds = Campground.all
      end

    else
      @campgrounds = Campground.all
    end
    return @campgrounds

end

end
