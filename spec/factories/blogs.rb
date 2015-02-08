FactoryGirl.define do
  factory :blog do
    name "JobBlock"
    description "JobDescription"
    uri "job"
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
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#
