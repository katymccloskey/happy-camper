class Campground < ApplicationRecord
  validates :name, uniqueness: true
  has_many :favorites
  has_many :users, through: :favorites
  has_many :cg_amenities
  has_many :amenities, through: :cg_amenities
  has_one :detail

  def find_amenity_accessible
    self.amenities.each do |amenity|
      amenity.name if amenity.name.downcase.include? "accessible"
    end
  end

  def find_amenity_fire
    self.amenities.each do |amenity|
      amenity.name if amenity.name.downcase.include? "campfire" || "fire" || "firewood" || "log"
    end
  end

  def find_amenity_water
    self.amenities.each do |amenity|
      amenity.name if amenity.name.downcase.include? "water" || "pump" || "toilet" || "drinking" || "sink"
    end
  end

  def find_amenity_fun
    self.amenities.each do |amenity|
      amenity.name if amenity.name.downcase.include? "horse" || "bike" || "kayak" || "boat" || "bird" || "view" || "rafting" || "theater" || "fishing"
    end
  end
  def find_amenity_general
    self.amenities.each do |amenity|
      amenity.name if amenity.name.downcase.include? "office" || "otel" || "store" || "shop" || "grocery" || "cafe" || "visitor"
    end
  end
end
