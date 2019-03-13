require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).not_to be_nil
    end

    describe "#email" do
      it { should validate_presence_of(:email) }
      it { expect(@user).not_to allow_value("blah").for(:email) }
      it { expect(@user).to allow_value("a@b.com").for(:email) }
    end

    describe "#password" do
      it { should validate_presence_of(:password) }
      it { expect(@user).not_to allow_value("123456").for(:email) }
      it { should validate_length_of(:password).is_at_least(6) }
    end

    describe "#first_name" do
      it { expect(@user.first_name).to be_a(String) }
    end

    describe "#last_name" do
      it { expect(@user.last_name).to be_a(String) }
    end

  end

  # context "associations" do

  #   describe "books" do
  #     it { expect(@user).to have_many(:books) }
  #   end

  # end

  # context "public instance methods" do

  #   describe "#full_name" do

  #     it "should return a string" do
  #       expect(@user.full_name).to be_a(String)
  #     end

  #     it "should return the full name" do
  #       expect(@user.full_name).to eq("John Doe")
  #       user_2 = create(:user, first_name: "Jean-Michel", last_name: "Durant")
  #       expect(user_2.full_name).to eq("Jean-Michel Durant")
  #     end
  #   end

  # end

end