# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    trait :default do
      description { "#{Faker::Food.unique.measurement} #{Faker::Food.unique.ingredient}" }
    end
  end
end
