class CampgroundsController < ApplicationController
  def show
    @campground = Campground.find(params[:id])
    if @campground.detail.nil?
      detail = Supercamp.details.contract_code(@campground.contract_id).id(@campground.facility_id).results
    @campground.detail << Detail.find_or_create_by(description: detail[:])
  end
end
