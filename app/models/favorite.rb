class Favorite < ApplicationRecord
  belongs_to :campground
  belongs_to :user
end
