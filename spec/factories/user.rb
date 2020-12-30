# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    trait :default do
      email { 'bob@vance.com' }
      password { 'Ta123456' }
    end
  end
end