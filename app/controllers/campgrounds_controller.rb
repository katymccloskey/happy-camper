class CampgroundsController < ApplicationController
  def show
    @campground = Campground.find(params[:id])
  end


end
