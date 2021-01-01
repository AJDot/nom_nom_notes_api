# frozen_string_literal: true

FactoryBot.define do
  factory :step do
    trait :default do
      description { Faker::Food.description }
    end
  end
end
