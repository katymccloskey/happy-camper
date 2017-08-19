class CampgroundsController < ApplicationController
  def show
    @campground = Campground.find(params[:id])
    if @campground.detail.nil?
      details = Supercamp.details.contract_code(@campground.contract_id).id(@campground.facility_id).results
      parent = details.find { |hash| hash.keys.include?(:parent) }.reduce[1]

      details.each do |detail|
       amenity = Amenity.find_or_create_by(name: detail[:name]) if detail[:distance] && detail[:name]
       @campground.amenities << amenity
     end
       prime_detail = Detail.create(city: details[0].city.titleize,
                                state: details[0].state,
                                address: details[0].street_address.titleize,
                                zip: details[0].zip,
                                description: parent.description,
                                facilities_description: parent.facilities_description,
                                important_info: parent.important_information,
                                recreation_description: parent.recreation_description,
                                orientation_description: parent.orientation_description,
                                reservation_url: parent.full_reservation_url,
                                campground: @campground
                                 )
       @campground.detail << prime_detail
     end

   end
