# == Schema Information
#
# Table name: post_ratings
#
#  id         :integer          not null, primary key
#  video_id   :integer
#  post_id    :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_ratings_on_post_id   (post_id)
#  index_post_ratings_on_video_id  (video_id)
#

FactoryGirl.define do
  factory :post_rating do
    video_id "MyString"
post_id "MyString"
amount "MyString"
  end

end
