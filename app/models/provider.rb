class Provider < ActiveRecord::Base
  belongs_to :user
  validates :uid, :name, presence: true
  validates :uid, uniqueness: { scope: :name }

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, name: auth.provider)
  end
end

# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_providers_on_user_id  (user_id)
#
