require 'rails_helper'

RSpec.describe Blog, :type => :model do
  it "is valid factory for :blog" do
    expect(FactoryGirl.create(:blog)).to be_valid
  end

  it "checks empty blog name" do
    blog = FactoryGirl.build(:blog, name: nil)
    blog.valid?
    expect(blog.errors[:name]).to include("can't be blank")
  end

  it "checks empty blog uri" do
    blog = FactoryGirl.build(:blog, uri: nil)
    blog.valid?
    expect(blog.errors[:uri]).to include("can't be blank")
  end

  it "take uniq blog uri" do
    blog  = FactoryGirl.create(:blog)
    blog2 = FactoryGirl.build(:blog)
    blog2.valid?
    expect(blog2.errors[:uri]).to include("has already been taken")
  end
end
