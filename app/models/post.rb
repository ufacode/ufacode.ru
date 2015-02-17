class Post < ActiveRecord::Base
  validates_presence_of :name, :blog, :author

  belongs_to :author, class_name: 'User'
  belongs_to :blog
end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :string(255)
#  content     :text(65535)
#  content_cut :text(65535)
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  blog_id     :integer
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
