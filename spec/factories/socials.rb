FactoryGirl.define do
  factory :social do
    
  end

end

# == Schema Information
#
# Table name: socials
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_socials_on_user_id  (user_id)
#
