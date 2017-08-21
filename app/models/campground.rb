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
   @url = @spot.photos[0].fetch_url(400)

  end

end
