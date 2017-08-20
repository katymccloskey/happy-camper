class Campground < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  validates :name, uniqueness: true
  has_many :favorites
  has_many :users, through: :favorites
  has_many :cg_amenities
  has_many :amenities, through: :cg_amenities
  has_one :detail
end
