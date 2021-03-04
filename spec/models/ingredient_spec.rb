# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  subject(:ingredient) do
    described_class.new(
      description: 'An Ingredient',
      recipe: create(:recipe, :default),
    )
  end

  it_behaves_like 'client_id'

  it 'is valid with valid attributes' do
    expect(ingredient).to be_valid
  end

  it 'is not valid without a description' do
    ingredient.description = nil
    expect(ingredient).not_to be_valid
  end

  it 'is not valid without a recipe' do
    ingredient.recipe = nil
    expect(ingredient).not_to be_valid
  end

  describe '.to_params' do
    it 'returns params useful for controllers' do
      expect(described_class.to_params).to(
        eq(
          %i[
            id
            client_id
            _destroy
            description
            recipe_id
            sort_order
          ],
        ),
      )
    end
  end
end
