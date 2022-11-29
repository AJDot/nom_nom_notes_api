# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    trait :default do
      name { "#{Faker::Food.dish} #{rand(1..1000)}" }
      description { Faker::Food.description }
      image { image_file }

      after(:create) do |recipe, _evaluator|
        FactoryBot.create_list(:ingredient, 5, :default, recipe:)
      end
    end
  end
end

def image_file(size: '300x300', format: 'png', background_color: nil, text_color: nil, text: nil)
  file = Tempfile.new('faker_placeholdit')
  file.binmode
  file << Net::HTTP.get(URI(Faker::Placeholdit.image(size:, format:, background_color:, text_color:, text:)))
  file.close

  ::File.new(file.path)
end
