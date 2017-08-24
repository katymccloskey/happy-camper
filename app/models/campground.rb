class Campground < ApplicationRecord
  GOOGLE_CLIENT = GooglePlaces::Client.new(ENV['GOOGLE_MAP_KEY'])

  validates :name, uniqueness: true
  has_many :favorites
  has_many :users, through: :favorites
  has_many :cg_amenities
  has_many :amenities, through: :cg_amenities
  has_one :detail

  def get_google_data
    @spots = GOOGLE_CLIENT.spots(self.latitude, self.longitude, detail: true)
    @reviews = []
    @urls = []
    @ratings = 0
    if !@spots.nil?
     @spots.first(5).each do |spot|
       if !spot.photos.nil?
         spot.photos.first(4).each do |photo|
           @urls << photo.fetch_url(1000)
         end
       end
       if !spot.reviews.nil?
        spot.reviews.first(6).each do |review|
          @reviews << review.text
        end
        self.google_picture = @urls
        self.reviews = @reviews
        self.save
      end
      if @ratings.nil? || @ratings.zero?
        @ratings = spot.rating
      end
    end
    self.rating = @ratings
    self.save
  end
end

def find_amenity_accessible
  self.amenities.select do |amenity|
    amenity.name if amenity.name.downcase.include? 'accessible'
  end.map(&:name)
end

def find_amenity_fire
  self.amenities.select do |amenity|
    next if amenity.name.downcase.include?('accessible')
    next unless amenity.name.downcase.include?('campfire') ||
    amenity.name.downcase.include?('fire') ||
    amenity.name.downcase.include?('firewood') ||
    amenity.name.downcase.include?('log')
    amenity.name
  end.map(&:name)
end

def find_amenity_water
  self.amenities.select do |amenity|
    next if amenity.name.downcase.include?('accessible')
    next unless amenity.name.downcase.include?('water') ||
    amenity.name.downcase.include?('pump') ||
    amenity.name.downcase.include?('toilet') ||
    amenity.name.downcase.include?('drinking') ||
    amenity.name.downcase.include?('sink')
    amenity.name
  end.map(&:name)
end

def find_amenity_water_sports
  self.amenities.select do |amenity|
    next if amenity.name.downcase.include?('accessible')
    next unless amenity.name.downcase.include?('kayak') ||
    amenity.name.downcase.include?('boat') ||
    amenity.name.downcase.include?('rafting') ||
    amenity.name.downcase.include?('fishing') ||
    amenity.name.downcase.include?('river') ||
    amenity.name.downcase.include?('lake')
    amenity.name
  end.map(&:name)
end

def find_amenity_trails
  self.amenities.select do |amenity|
    next if amenity.name.downcase.include?('accessible')
    next unless amenity.name.downcase.include?('horse') ||
    amenity.name.downcase.include?('bike') ||
    amenity.name.downcase.include?('hike') ||
    amenity.name.downcase.include?('trail')
    amenity.name
  end.map(&:name)
end

def find_amenity_community
  self.amenities.select do |amenity|
    next if amenity.name.downcase.include?('accessible')
    next unless amenity.name.downcase.include?('theater') ||
    amenity.name.downcase.include?('play') ||
    amenity.name.downcase.include?('community')
    amenity.name
  end.map(&:name)
end

def find_amenity_views
  self.amenities.select do |amenity|
    next if amenity.name.downcase.include?('accessible')
    next unless amenity.name.downcase.include?('bird') ||
    amenity.name.downcase.include?('view') ||
    amenity.name.downcase.include?('landscape') ||
    amenity.name.downcase.include?('scenic') ||
    amenity.name.downcase.include?('scene')
    amenity.name
  end.map(&:name)
end

def find_amenity_general
  self.amenities.select do |amenity|
    next if amenity.name.downcase.include?('accessible')
    next unless amenity.name.downcase.include?('office') ||
    amenity.name.downcase.include?('otel') ||
    amenity.name.downcase.include?('store') ||
    amenity.name.downcase.include?('shop') ||
    amenity.name.downcase.include?('grocery') ||
    amenity.name.downcase.include?('cafe') ||
    amenity.name.downcase.include?('visitor')
    amenity.name
  end.map(&:name)
end
end
