module CampgroundsHelper

  def found_favorite(user, campground)
    Favorite.find_by(user_id: user.id, campground_id: campground.id)
  end

end
