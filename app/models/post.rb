class Post < ActiveRecord::Base
  include Sortable
  before_validation :fill_content_cut

  mount_uploader :image, ImageUploader

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :blog
  has_many   :ratings, class_name: 'PostRating', foreign_key: :post_id
  has_many   :comments, dependent: :destroy

  validates :name, :blog_id, :author, presence: true

  def like!(user)
    change_rating :like, user
  end

  def dislike!(user)
    change_rating :dislike, user
  end

  private

  def fill_content_cut
    unless content.empty?
      self.content_cut = content.split.first(15).join(' ')
    end
  end

  def change_rating(action, user)
    amount = (action == :like) ? 1 : -1
    return if ratings.where(user: user).exists?

    ratings.create({
                      amount: amount,
                      user:   user
                    })
    update_attributes(rating: rating + amount)
    increment!( (amount > 0) ? :likes : :dislikes)
  end
end

# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  image        :string(255)
#  content      :text(65535)
#  content_cut  :text(65535)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  blog_id      :integer
#  announcement :boolean
#  likes        :integer          default(0)
#  dislikes     :integer          default(0)
#  rating       :integer          default(0)
#
