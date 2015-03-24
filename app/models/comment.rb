class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: 'User'
  validates_presence_of :content, :user
end

# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  author_id   :integer
#  content     :text(65535)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_author_id  (author_id)
#
