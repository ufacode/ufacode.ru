# frozen_string_literal: true
class Post < ActiveRecord::Base
  include Sortable
  before_validation :fill_content_cut

  mount_uploader :image, ImageUploader

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :blog
  has_many   :ratings, class_name: 'PostRating', foreign_key: :post_id
  has_many   :comments, dependent: :destroy

  validates :name, :blog_id, :author, presence: true

  scope :filter_by_tag, ->(tag) { tagged_with(tag) if tag }

  acts_as_taggable

  searchable do
    text :name, :content
    integer :blog_id
  end

  def like!(user)
    change_rating :like, user
  end

  def dislike!(user)
    change_rating :dislike, user
  end

  private

  def fill_content_cut
    self.content_cut = content.split.first(15).join(' ') unless content.empty?
  end

  def change_rating(action, user)
    amount = action == :like ? 1 : -1
    return if ratings.where(user: user).exists?

    ratings.create(amount: amount, user:   user)
    update_attributes(rating: rating + amount)
    increment!(amount.positive? ? :likes : :dislikes)
  end
end

# == Schema Information
#
# Table name: posts
#
#  announcement :boolean
#  blog_id      :integer
#  content      :text(65535)
#  content_cut  :text(65535)
#  created_at   :datetime         not null
#  dislikes     :integer          default("0")
#  id           :integer          not null, primary key
#  image        :string(255)
#  likes        :integer          default("0")
#  name         :string(255)
#  rating       :integer          default("0")
#  updated_at   :datetime         not null
#  user_id      :integer
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
