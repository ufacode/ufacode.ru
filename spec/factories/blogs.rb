FactoryGirl.define do
  factory :blog do
    name "JobBlock"
    description "JobDescription"
    uri "job"
    association :author, factory: :user, strategy: :build
  end
end
