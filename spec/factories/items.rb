FactoryBot.define do
  factory :item do
    name { Faker::Commerce.unique.product_name }
    description { Faker::Marketing.buzzwords }
    unit_price { Faker::Commerce.price }
    association :merchant
  end
end
