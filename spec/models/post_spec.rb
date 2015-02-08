require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "is valid factory for :post" do
    expect(FactoryGirl.create(:post)).to be_valid
  end

  it "checks empty post name" do
    post = FactoryGirl.build(:post, name: nil)
    post.valid?
    expect(post.errors[:name]).to include("can't be blank")
  end

  it "checks empty author" do
    post = FactoryGirl.build(:post, author: nil)
    post.valid?
    expect(post.errors[:author]).to include("can't be blank")
  end

  it "checks empty blog" do
    post = FactoryGirl.build(:post, blog: nil)
    post.valid?
    expect(post.errors[:blog]).to include("can't be blank")
  end

end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :string(255)
#  content     :text(65535)
#  content_cut :text(65535)
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  blog_id     :integer
#
