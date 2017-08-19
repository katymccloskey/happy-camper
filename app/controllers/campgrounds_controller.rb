class CampgroundsController < ApplicationController
  def show
    @campground = Campground.find(params[:id])
    if @campground.detail.nil?
      details = Supercamp.details.contract_code(@campground.contract_id).id(@campground.facility_id).results
      details.each do |detail|
       amenity = Amenity.find_or_create_by(name: detail[:name]) if detail[:distance] && detail[:name]
       @campground.amenities << amenity

       @campground.detail << Detail.create(description: detail[:])
     end
   end
