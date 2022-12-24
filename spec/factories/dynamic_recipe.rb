# frozen_string_literal: true

FactoryBot.define do
  factory :dynamic_recipe do
    trait :default do
      name { "#{Faker::Food.dish} #{rand(1..1000)}" }
      blocks do
        [
          { id: SecureRandom.uuid, type: 'h1', content: { text: Faker::Food.dish } },
          { id: SecureRandom.uuid, type: 'text', content: { text: Faker::Food.description } },
        ]
      end
    end
  end
end
