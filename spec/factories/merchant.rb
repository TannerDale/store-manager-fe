FactoryBot.define do
  factory :merchant_poro do
    attributes { { name: Faker::Movie.unique.title } }
    id { Faker::Number.within(range: 1..10) }

    initialize_with { new(attributes) }
  end
end
