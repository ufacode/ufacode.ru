class Blog < ActiveRecord::Base
  validates :name, :uri, presence: true
  validates :uri, uniqueness: true
  validates :name, length: { maximum: 255 }
  validates :uri,  length: { maximum: 32 }

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :posts, dependent: :destroy

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
#  uri         :string(32)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
