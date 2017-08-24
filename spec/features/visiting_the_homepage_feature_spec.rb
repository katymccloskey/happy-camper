require 'rails_helper'

feature "visiting the homepage" do
  scenario "the user sees a list of songs and can view them" do

    campground = FactoryGirl.create(:campground)

    visit "/"

    # within(".header h1") do
    #   expect(page).to have_content campground.name
    #   click_link("#{campground.name}")
    # end

    #  within(".map-detail-row") do
    #   expect(page).to have_content campground.name
    #   click_link("#{campground.name}")
    # end

    expect(page).to have_current_path campground_path(campground)
  end
end
