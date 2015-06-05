require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'is valid factory for :blog' do
    expect(create(:blog)).to be_valid
  end

  it 'checks empty blog name' do
    blog = build(:blog, name: nil)
    blog.valid?
    expect(blog.errors[:name]).to include("can't be blank")
  end

  it 'checks empty blog uri' do
    blog = build(:blog, uri: nil)
    blog.valid?
    expect(blog.errors[:uri]).to include("can't be blank")
  end

  it 'take uniq blog uri' do
    create(:blog, uri: 'test')
    blog2 = build(:blog,  uri: 'test')
    blog2.valid?
    expect(blog2.errors[:uri]).to include('has already been taken')
  end

  it 'take length limit for uri' do
    blog = build(:blog, uri: 'X' * 44)
    blog.valid?
    expect(blog.errors[:uri]).to include('is too long (maximum is 32 characters)')
  end

  it 'take max length limit for blog name' do
    blog = build(:blog, name: 'X' * 444)
    blog.valid?
    expect(blog.errors[:name]).to include('is too long (maximum is 255 characters)')
  end
end

# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  uri         :string(32)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
