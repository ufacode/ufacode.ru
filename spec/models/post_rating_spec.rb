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

require 'rails_helper'

RSpec.describe PostRating, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
