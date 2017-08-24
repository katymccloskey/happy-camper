require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { user = FactoryGirl.create(:user) }
  describe "user attributes" do
    it "has a username" do
      expect(user.username).to eq("test")
    end

    it "has a email" do
      expect(user.email).to eq("test@test.com")
    end

    it "has a password" do
      expect(user.password).to eq("test123")
    end

  end


  describe "user validations" do
    context "user inputs valid information" do
      let(:user) { user = FactoryGirl.create(:user2) }

      it "is valid when there is a username" do
        expect(user.errors[:username]).to be_empty
      end

      it "is valid when there is a email" do
        expect(user.errors[:email]).to be_empty
      end

      it "is valid when there is a password" do
        expect(user.errors[:password]).to be_empty
      end
    end

    context "user inputs invalid information" do

      it "is invalid when there is no username" do
        user = User.create
        expect(user.errors[:username]).to_not be_empty
      end

      it "is invalid when there is no email" do
        user = User.create
        expect(user.errors[:email]).to_not be_empty
      end

        it "is invalid when there is no password" do
        user = User.create
        expect(user.errors[:password]).to_not be_empty
      end

    end
  end
end
