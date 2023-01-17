# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    name { Faker::Food.unique.fruits }
  end
end
