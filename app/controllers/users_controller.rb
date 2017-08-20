class UsersController < ApplicationController

 def show
  @user = User.find(params[:id])
  @campground = Campground.all.limit(12)
  # uncomment as soon as user.favorites is functioning, above line just for example data
  # @campground = @user.favorites
 end

end
