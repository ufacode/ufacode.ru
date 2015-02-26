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

FactoryGirl.define do
  factory :provider do
    user nil
name "MyString"
uid "MyString"
  end

end
