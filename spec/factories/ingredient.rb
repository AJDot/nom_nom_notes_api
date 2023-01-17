# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    description { "#{Faker::Food.measurement} #{Faker::Food.unique.ingredient}" }
  end
end
