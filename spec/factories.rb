FactoryGirl.define do

  factory :user do
    username      "test"
    email         "test@test.com"
    password         "test123"
  end

  factory :user2, :class => User do
    username      "test2"
    email         "test2@test.com"
    password      "test123"
  end

  factory :campground do
    name  "Agnew Meadows Group Camp"
    id "512"
    contract_id "NRSO"
    facility_id "70158"
    latitude "37.6822222"
   longitude "-119.0894444"
  end

  factory :campgrounds do
    name "7 Il Ranch"
  end
end
