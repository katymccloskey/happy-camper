require "rails_helper"

RSpec.describe "Routing to the application", :type => :routing do
  it "routes GET / to campgrounds#index" do
    expect(:get => "/").to route_to("campgrounds#index" )
  end

  it "routes GET /campgrounds/512 to campgrounds#show" do
    expect(:get => "/campgrounds/512").to route_to("campgrounds#show", id: "512")
  end

  it "routes GET /users/8 to users#show" do
    expect(:get => "/users/8").to route_to("users#show", id: "8")
  end

  it "routes GET /users/sign_in to users/sessions#new" do
    expect(:get => "/users/sign_in").to route_to("users/sessions#new")
  end

  it "routes GET /users/sign_up to devise/registrations#new" do
    expect(:get => "/users/sign_up").to route_to("devise/registrations#new")
  end

   it "routes POST /users to devise/registrations#create" do
    expect(:post => "/users").to route_to("devise/registrations#create")
  end

  it "routes POST /users/sign_in to users/sessions#new" do
    expect(:post => "/users/sign_in").to route_to("users/sessions#create")
  end

   it "routes DELETE /users/sign_out to users/sessions#destroy" do
    expect(:delete => "/users/sign_out").to route_to("users/sessions#destroy")
  end

  it "routes GET /users/auth/google_oauth2 to users/omniauth_callbacks#passthru" do
    expect(:get => "/users/auth/google_oauth2").to route_to("users/omniauth_callbacks#passthru")
  end

  it "routes POST /users/auth/google_oauth2 to users/omniauth_callbacks#passthru" do
    expect(:post => "/users/auth/google_oauth2").to route_to("users/omniauth_callbacks#passthru")
  end

   it "routes GET /users/auth/google_oauth2/callback to users/omniauth_callbacks#google_oauth2" do
    expect(:get => "/users/auth/google_oauth2/callback").to route_to("users/omniauth_callbacks#google_oauth2")
  end

  it "routes POST /users/auth/google_oauth2/callback to users/omniauth_callbacks#google_oauth2" do
    expect(:post => "/users/auth/google_oauth2/callback").to route_to("users/omniauth_callbacks#google_oauth2")
  end
end
