# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    trait :default do
      email { 'bob@vance.com' }
      password { 'ah123456' }
      password_confirmation { password }
    end
  end
end
