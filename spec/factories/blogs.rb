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
#  uri         :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_blogs_on_uri      (uri)
#  index_blogs_on_user_id  (user_id)
#
