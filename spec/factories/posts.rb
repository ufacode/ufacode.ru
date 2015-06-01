FactoryGirl.define do
  factory :post do
    name  { Faker::Lorem.sentence(rand(5..10)) }
    content  { Faker::Lorem.sentence( rand(100..1000) ) }
    association :author, factory: :user#, strategy: :build #makes error when testing posts#show
                                        # user cant been found in DB
    rating { rand(1..789) }
    blog
  end
end

# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  image        :string(255)
#  content      :text(65535)
#  content_cut  :text(65535)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  blog_id      :integer
#  announcement :boolean
#  likes        :integer          default("0")
#  dislikes     :integer          default("0")
#  rating       :integer          default("0")
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
