# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'philip.fry@planet-express.com' }
    password { 'ah123456' }
    password_confirmation { password }
    username { 'orangejoe' }
  end
end
