FactoryGirl.define do
  factory :post do
    name "PostName"
    image "ImageFile"
    content "FullText"
    association :author, factory: :user, strategy: :build
    association :blog,   factory: :blog, strategy: :build
  end
end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :string(255)
#  content     :text(65535)
#  content_cut :text(65535)
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  blog_id     :integer
#
