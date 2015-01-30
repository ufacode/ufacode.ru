class Post < ActiveRecord::Base
  validates_presence_of :name, :blog, :author

  belongs_to :author, class_name: 'User'
  belongs_to :blog
end
