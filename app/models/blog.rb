# frozen_string_literal: true
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
#  created_at  :datetime         not null
#  description :text(65535)
#  id          :integer          not null, primary key
#  name        :string(255)
#  updated_at  :datetime         not null
#  uri         :string(255)
#  user_id     :integer
#
# Indexes
#
#  index_blogs_on_uri      (uri)
#  index_blogs_on_user_id  (user_id)
#
