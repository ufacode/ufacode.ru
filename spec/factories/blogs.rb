FactoryGirl.define do
  factory :blog do
    name  { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    uri { Faker::Lorem.characters(25) }
    association :author, factory: :user, strategy: :build
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
