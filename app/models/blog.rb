class Blog < ActiveRecord::Base
  validates_presence_of   :name, :uri
  validates_uniqueness_of :uri

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many   :posts
end

# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  uri         :string(32)
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#
