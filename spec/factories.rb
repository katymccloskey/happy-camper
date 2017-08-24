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
end
