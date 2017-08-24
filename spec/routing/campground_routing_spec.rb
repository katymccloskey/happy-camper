require "rails_helper"

RSpec.describe "Routing to the application", :type => :routing do
  it "routes GET / to campgrounds#index" do
    expect(:get => "/").to route_to("campgrounds#index" )
  end

  it "routes GET /campgrounds/512 to campgrounds#show" do
    expect(:get => "/campgrounds/512").to route_to("campgrounds#show", id: "512")
  end

  it "routes GET /campgrounds/512 to campgrounds#show" do
    expect(:get => "/campgrounds/512").to route_to("campgrounds#show", id: "512")
  end
end
