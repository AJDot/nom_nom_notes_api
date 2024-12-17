# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'philip.fry@planet-express.com' }
    password { 'ah123456' }
    username { 'orangejoe' }
    status { 'verified' }
  end
end
