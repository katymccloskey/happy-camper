class UsersController < ApplicationController

 def show
  @user = User.find(params[:id])
  @campgrounds = Favorite.all
 end

end
