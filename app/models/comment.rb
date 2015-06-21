class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  validates :content, :post, :author, presence: true

  has_closure_tree dependent: :destroy
  acts_as_tree
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
#
# Indexes
#
#  index_comments_on_parent_id  (parent_id)
#  index_comments_on_post_id    (post_id)
#  index_comments_on_user_id    (user_id)
#
