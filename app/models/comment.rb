# frozen_string_literal: true
class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  validates :content, :post, :author, presence: true

  has_closure_tree dependent: :destroy
  has_many :ratings, class_name: 'CommentRating', foreign_key: :comment_id
  acts_as_tree

  def like!(user)
    change_rating :like, user
  end

  def dislike!(user)
    change_rating :dislike, user
  end

  private

  def change_rating(action, user)
    amount = action == :like ? 1 : -1
    return if ratings.where(user: user).exists?

    rating.create(amount: amount,
                  user: user)
    update_attributes(rating: rating + amount)
    increment!(amount > 0 ? :likes : :dislikes)
  end
end

# == Schema Information
#
# Table name: comments
#
#  content    :text(65535)
#  created_at :datetime         not null
#  dislikes   :integer          default("0")
#  id         :integer          not null, primary key
#  likes      :integer          default("0")
#  parent_id  :integer
#  post_id    :integer
#  rating     :integer          default("0")
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_comments_on_parent_id  (parent_id)
#  index_comments_on_post_id    (post_id)
#  index_comments_on_user_id    (user_id)
#
