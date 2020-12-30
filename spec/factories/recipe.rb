# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    trait :default do
      name { Faker::Food.unique.dish }
    end
  end
end
