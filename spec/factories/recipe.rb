# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name { "#{Faker::Food.dish} #{rand(1..1000)}" }

    trait :description do
      description { Faker::Food.description }
    end

    trait :image do
      image { image_file }
    end

    trait :ingredients do
      after(:create) do |recipe, _evaluator|
        FactoryBot.create_list(:ingredient, 5, recipe:) unless recipe.ingredients.present?
      end
    end
  end
end

def image_file(size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil)
  file = Tempfile.new('faker_placeholdit')
  file.binmode
  file << Net::HTTP.get(URI(Faker::Placeholdit.image(size:, format:, background_color:, text_color:, text:)))
  file.close

  File.new(file.path)
end
