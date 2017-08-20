class CampgroundsController < ApplicationController
  def show
    @campground = Campground.find(params[:id])
    if @campground.detail.nil?
      details = Supercamp.details.contract_code(@campground.contract_id).id(@campground.facility_id).results
      parent = details.find { |hash| hash.keys.include?(:parent) }.reduce[1]

      details.each do |detail|
       @campground.amenities << Amenity.find_or_create_by(name: detail[:name]) if detail[:distance] && detail[:name]
     end

     prime_detail = Detail.create(city: details[0].city.titleize,
      state: details[0].state,
      address: details[0].street_address.titleize,
      description: parent.description,
      facilities_description: parent.facilities_description,
      important_info: parent.important_information,
      recreation_description: parent.recreation_description,
      orientation_description: parent.orientation_description,
      reservation_url: parent.full_reservation_url,
      campground: @campground
      )
   end

   @show = {lat:@campground.latitude,lng:@campground.longitude,name:@campground.name,city:@campground.detail.city,state:@campground.state}.to_json

 end

   def index
    @campgrounds = Campground.where(state: "CA")
    @state = @campgrounds.first.state
    @hash = Gmaps4rails.build_markers(@campgrounds) do |campground, marker|
      marker.lat campground.latitude
      marker.lng campground.longitude
      marker.infowindow campground.name
    end
   end


end
