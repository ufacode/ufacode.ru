FactoryGirl.define do
  factory :post do
    name "PostName"
    image "ImageFile"
    content "FullText"
    association :author, factory: :user, strategy: :build
    association :blog,   factory: :blog, strategy: :build
  end
end
