require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'is valid factory for :blog' do
    expect(create(:blog)).to be_valid
  end

  it 'checks empty blog name' do
    blog = build(:blog, name: nil)
    blog.valid?
    expect(blog.errors[:name]).to include I18n.t('errors.messages.blank')
  end

  it 'checks empty blog uri' do
    blog = build(:blog, uri: nil)
    blog.valid?
    expect(blog.errors[:uri]).to include I18n.t('errors.messages.blank')
  end

  it 'take uniq blog uri' do
    create(:blog, uri: 'test')
    blog2 = build(:blog,  uri: 'test')
    blog2.valid?
    expect(blog2.errors[:uri]).to include I18n.t('errors.messages.taken')
  end

  it 'take length limit for uri' do
    blog = build(:blog, uri: 'X' * 44)
    blog.valid?
    expect(blog.errors[:uri]).to include I18n.t('errors.messages.too_long', count: 32)
  end

  it 'take max length limit for blog name' do
    blog = build(:blog, name: 'X' * 444)
    blog.valid?
    expect(blog.errors[:name]).to include I18n.t('errors.messages.too_long', count: 255)
  end
end

# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  uri         :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_blogs_on_uri      (uri)
#  index_blogs_on_user_id  (user_id)
#
