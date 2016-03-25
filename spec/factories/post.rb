FactoryGirl.define do
  factory :post do
    title { FFaker::Lorem.phrase }
    body { FFaker::Lorem.paragraph }
  end
 end