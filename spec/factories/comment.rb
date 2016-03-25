FactoryGirl.define do
  factory :comment do
    name { FFaker::Internet.user_name }
    body { FFaker::Lorem.sentence }
    association :post
  end
end