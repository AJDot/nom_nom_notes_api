# frozen_string_literal: true

require 'rails_helper'
require_relative 'concerns/client_id_spec'

RSpec.describe RecipeCategory, type: :model do
  subject do
    described_class.new(
      recipe: create(:recipe, :default),
      category: create(:category, :default),
    )
  end

  it_behaves_like 'client_id'

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a recipe' do
    subject.recipe = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a category' do
    subject.category = nil
    expect(subject).to_not be_valid
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
