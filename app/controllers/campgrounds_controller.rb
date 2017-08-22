class CampgroundsController < ApplicationController

  include CampgroundsHelper

  def show
    @campground = Campground.find(params[:id])
    @place_stuff = @campground.google_photos

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
        # Gsub madness
        state: details[0].state,
        address: details[0].street_address.titleize,
        description: parent.description.gsub(/&apos;/, "'").gsub(/&amp;#39;/, ","),
        facilities_description: parent.facilities_description.gsub(/&apos;/, "'").gsub(/&amp;#39;/, ","),
        # Ugly Gsub \n generator for important_info don't look
        important_info: parent.important_information.gsub(/&apos;/, "'").gsub(/&amp;#39;/, ",").gsub(/\. /, ". \n "),
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

    if params[:term]
      term = params[:term].titleize
      state = CampgroundsHelper::states_list(params[:term].titleize)

      if state
         @campgrounds = Campground.where('state ILIKE ?', "%#{state}%")

      else
         @campgrounds = Campground.where('name ILIKE ?', "%#{term}%")
      end


      if @campgrounds.empty?
        @campgrounds = Campground.all
      end

    else
      @campgrounds = Campground.all
    end

      @state = @campgrounds.first.state
      @hash = Gmaps4rails.build_markers(@campgrounds) do |campground, marker|
        marker.lat campground.latitude
        marker.lng campground.longitude
        # binding.pry
        # marker.infowindow render_to_string(campground.name, campground_path(campground.id))
        marker.infowindow "<a href=/campgrounds/#{campground.id}>#{campground.name}</a>"
        # marker.infowindow render(campground.name, campground_path(campground.id))
        marker.picture({
           :url => "http://maps.gstatic.com/mapfiles/ms2/micons/campground.png", # up to you to pass the proper parameters in the url, I guess with a method from device
           :width   => 32,
           :height  => 32
         })
        # binding.pry
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

  def campground_params
    params.require(:campgruond).permit(:name, :state)
  end

end
