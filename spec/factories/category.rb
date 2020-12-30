# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    trait :default do
      name { Faker::Food.unique.fruits }
    end
  end
end
