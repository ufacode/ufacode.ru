class Social < ActiveRecord::Base
	belongs_to :user
end

# == Schema Information
#
# Table name: socials
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  value      :text(65535)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
