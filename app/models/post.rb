class Post < ActiveRecord::Base
  validates :name, :blog, :author, presence: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :blog
  mount_uploader :image, ImageUploader
  before_validation :fill_content_cut

  private
  def fill_content_cut
    unless content.empty?
      self.content_cut = content.split.first(15).join(' ')
    end
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
#
