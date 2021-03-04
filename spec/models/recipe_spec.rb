# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject(:recipe) do
    described_class.new(
      name: 'A Recipe',
    )
  end

  it_behaves_like 'client_id'

  it 'is valid with valid attributes' do
    expect(recipe).to be_valid
  end

  context 'with invalid name' do
    before do
      recipe.name = nil
    end

    it 'is not valid without a name' do
      expect(recipe).not_to be_valid
    end

    it 'reports an error for the name attribute' do
      recipe.valid?
      expect(recipe.errors[:name]).to eq(['must be between 1 and 100 characters'])
    end
  end

  context 'without a unique name' do
    before do
      described_class.create(name: 'A Recipe')
    end

    it 'is not valid without a unique name' do
      expect(recipe).not_to be_valid
    end

    it 'reports an error for the name attribute' do
      recipe.valid?
      expect(recipe.errors[:name]).to eq(['must be unique'])
    end
  end

  context 'without a valid length name' do
    before do
      recipe.name = 'a' * 101
    end

    it 'is not valid' do
      expect(recipe).not_to be_valid
    end

    it 'reports an error for the name attribute' do
      recipe.valid?
      expect(recipe.errors[:name]).to eq(['must be between 1 and 100 characters'])
    end
  end

  describe '.to_params' do
    it 'returns params useful for controllers' do
      expect(described_class.to_params).to(
        eq(
          %i[
            id
            client_id
            name
            description
            cook_time
            note
            image
          ],
        ),
      )
    end
  end
end
