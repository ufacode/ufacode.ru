require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'checks content is nil' do
    comment = build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end

  it 'checks content is empty' do
    comment = build(:comment, content: '')
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end

  it 'checks with author associated' do
    comment = build(:comment, author: nil)
    comment.valid?
    expect(comment.errors[:author]).to include("can't be blank")
  end

  it 'checks with post associated' do
    comment = build(:comment, post: nil)
    comment.valid?
    expect(comment.errors[:post]).to include("can't be blank")
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  content    :text(65535)
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  likes      :integer          default(0)
#  dislikes   :integer          default(0)
#  rating     :integer          default(0)
#
# Indexes
#
#  index_comments_on_parent_id  (parent_id)
#  index_comments_on_post_id    (post_id)
#  index_comments_on_user_id    (user_id)
#
