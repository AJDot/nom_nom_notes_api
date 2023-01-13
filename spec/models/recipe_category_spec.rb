# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeCategory, type: :model do
  subject(:rec_cat) do
    described_class.new(
      recipe: create(:recipe),
      category: create(:category),
    )
  end

  it_behaves_like 'client_id'

  it 'is valid with valid attributes' do
    expect(rec_cat).to be_valid
  end

  it 'is not valid without a recipe' do
    rec_cat.recipe = nil
    expect(rec_cat).not_to be_valid
  end

  it 'is not valid without a category' do
    rec_cat.category = nil
    expect(rec_cat).not_to be_valid
  end

  describe '.to_params' do
    it 'returns params useful for controllers' do
      expect(described_class.to_params).to(
        eq(
          %i[
            id
            client_id
            _destroy
            recipe_id
            category_id
          ],
        ),
      )
    end
  end
end
