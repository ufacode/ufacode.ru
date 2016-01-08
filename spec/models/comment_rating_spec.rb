require 'rails_helper'

RSpec.describe CommentRating, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: comment_ratings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  comment_id :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comment_ratings_on_comment_id  (comment_id)
#  index_comment_ratings_on_user_id     (user_id)
#
