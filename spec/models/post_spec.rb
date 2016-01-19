# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  image        :string(255)
#  content      :text(65535)
#  content_cut  :text(65535)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  blog_id      :integer
#  announcement :boolean
#  likes        :integer          default(0)
#  dislikes     :integer          default(0)
#  rating       :integer          default(0)
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid factory for :post' do
    expect(create(:post)).to be_valid
  end

  it 'is fill content_cut automatically' do
    post = create(:post)
    expect(post.content).not_to be_empty
    expect(post.content_cut).not_to be_empty
  end
end
