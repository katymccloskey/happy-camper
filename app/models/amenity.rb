class Amenity < ApplicationRecord

  validates :name, uniqueness: true
end
