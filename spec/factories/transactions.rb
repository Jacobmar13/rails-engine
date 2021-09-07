FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Number.unique.number(digits: 16) }
    credit_card_expiration_date { "01/25" }
    result { "success" }
  end
end
