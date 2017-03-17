FactoryGirl.define do
  factory :comment do
    parent_id nil
    content { Faker::Lorem.sentence(15) }
    post
    author  { create(:user) }
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
