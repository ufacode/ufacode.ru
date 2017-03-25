# frozen_string_literal: true
class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :ratings, as: :ratingable

  validates :content, :post, :author, presence: true

  acts_as_tree
  has_closure_tree dependent: :destroy

  def rating
    ratings.sum(:amount)
  end
end

# == Schema Information
#
# Table name: comments
#
#  content    :text(65535)
#  created_at :datetime         not null
#  dislikes   :integer          default(0)
#  id         :integer          not null, primary key
#  likes      :integer          default(0)
#  parent_id  :integer
#  post_id    :integer
#  rating     :integer          default(0)
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_comments_on_parent_id  (parent_id)
#  index_comments_on_post_id    (post_id)
#  index_comments_on_user_id    (user_id)
#
