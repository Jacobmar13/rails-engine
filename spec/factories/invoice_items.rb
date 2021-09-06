FactoryBot.define do
  factory :invoice_item do
    quantity { Faker::Number.between(from: 1, to: 99) }
    unit_price { Faker::Commerce.price }
  end
end
