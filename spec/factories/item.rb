FactoryBot.define do
  factory :item_poro do
    attributes do
      {
        name: Faker::Movie.unique.title,
        description: Faker::Lorem.sentence,
        unit_price: (100..1000).to_a.sample,
        merchant_id: (10..100).to_a.sample
      }
    end
    id { Faker::Number.within(range: 1..10) }

    initialize_with { new(attributes) }
  end
end
