require 'rails_helper'

RSpec.describe CampgroundsController, type: :controller do
  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns @location based on current location" do
      get :index
      expect(assigns(:location).data["region_code"]).to eq ("TX")
    end


    it "returns @campgrounds based on current location" do
      get :index
      expect(assigns(@campgrounds)).to_not be_empty
    end

    it "returns @hash based on current location" do
      get :index
      expect(assigns(@hash)).to_not be_empty
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end


   it "returns http success when campground is found" do
      get :index ,params:{term: "Texas"}
      expect(response).to have_http_status(:success)
    end


   it "returns error if search is not found" do
      get :index, params:{term: "hot dog"}
      expect(flash[:error]).to eq ("Your search didn't pull up any results. TRY AGAIN")
    end
  end

  describe "GET #show" do
    let!(:campground) { FactoryGirl.create(:campground) }

    it "returns http success" do
      get :show , params: {id: campground.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the :show template" do
      get :show, params: { id: campground.id }
      expect(response).to render_template(:show)
    end
  end

end


