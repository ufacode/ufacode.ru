class Blog < ActiveRecord::Base
  validates_presence_of :name, :uri
  validates_uniqueness_of :uri

  validates :name, length: { maximum: 255 }
  validates :uri,  length: { maximum: 32 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :posts

  def to_param
    uri
  end
end

# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  uri         :string(255)
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_blogs_on_author_id  (author_id)
#  index_blogs_on_uri        (uri)
#
