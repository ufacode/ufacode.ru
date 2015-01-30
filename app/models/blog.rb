class Blog < ActiveRecord::Base
  validates_presence_of   :name, :uri
  validates_uniqueness_of :uri

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many   :posts
end
