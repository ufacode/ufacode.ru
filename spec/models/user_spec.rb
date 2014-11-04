require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid factory :user" do
    expect(FactoryGirl.create(:user)).to be_valid
        # to have(1).error_on(:name)
  end

  it "checks empty user name" do
    user = FactoryGirl.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "checks empty user email" do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "take uniq emails" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.build(:user)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end
end
