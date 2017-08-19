class UsersController < ApplicationController

 def show
  @user = User.find(params[:id])
  @campground = Campground.all.limit(12)
 end

end
