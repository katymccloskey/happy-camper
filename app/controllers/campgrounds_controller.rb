class CampgroundsController < ApplicationController

  include CampgroundsHelper

  def show
    @campground = Campground.find(params[:id])
    if @campground.contract_id.length < 4
      redirect_to no_detail_path(@campground)
    else
      if @campground.detail.nil?
        details = Supercamp.details.contract_code(@campground.contract_id).id(@campground.facility_id).results
        parent = details.find { |hash| hash.keys.include?(:parent) }.reduce[1]

        details.each do |detail|
         @campground.amenities << Amenity.find_or_create_by(name: detail[:name]) if detail[:distance] && detail[:name]
       end

       prime_detail = Detail.create(city: details[0].city.titleize,
        state: details[0].state,
        address: details[0].street_address.titleize,
        description: parent.description.gsub(/&apos;/, "'").gsub(/&amp;#39;/, ","),
        facilities_description: parent.facilities_description.gsub(/&apos;/, "'").gsub(/&amp;#39;/, ","),
        important_info: parent.important_information.gsub(/&apos;/, "'").gsub(/&amp;#39;/, ","),
        recreation_description: parent.recreation_description.gsub(/&apos;/, "'").gsub(/&amp;#39;/, ","),
        orientation_description: parent.orientation_description.gsub(/&apos;/, "'").gsub(/&amp;#39;/, ","),
        reservation_url: parent.full_reservation_url,
        campground: @campground
        )
      end

     @show = {lat:@campground.latitude,lng:@campground.longitude,name:@campground.name,city:@campground.detail.city,state:@campground.state}.to_json
    end
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

  def toggle_favorite
    @campground = Campground.find(params[:id])
    @user = current_user
    if found_favorite(@user, @campground)
      found_favorite(@user, @campground).destroy
      redirect_to @campground
    else
      @user.favorites.create(campground: @campground, user: @user)
      redirect_to @campground
    end
  end

  def no_detail
    @campground = Campground.find(params[:id])
  end

end
