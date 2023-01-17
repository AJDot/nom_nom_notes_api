# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DynamicRecipe, type: :model do
  subject(:dynamic_recipe) do
    described_class.new(
      name: 'A Dynamic Recipe',
    )
  end

  it_behaves_like 'client_id'

  it 'is valid with valid attributes' do
    expect(dynamic_recipe).to be_valid
  end

  context 'with invalid name' do
    before do
      dynamic_recipe.name = nil
    end

    it 'is not valid without a name' do
      expect(dynamic_recipe).not_to be_valid
    end

    it 'reports an error for the name attribute' do
      dynamic_recipe.valid?
      expect(dynamic_recipe.errors[:name]).to eq(['must be between 1 and 100 characters'])
    end
  end

  context 'without a unique name' do
    before do
      described_class.create(name: 'A Dynamic Recipe')
    end

    it 'is not valid without a unique name' do
      expect(dynamic_recipe).not_to be_valid
    end

    it 'reports an error for the name attribute' do
      dynamic_recipe.valid?
      expect(dynamic_recipe.errors[:name]).to eq(['must be unique'])
    end
  end

  context 'without a valid length name' do
    before do
      dynamic_recipe.name = 'a' * 101
    end

    it 'is not valid' do
      expect(dynamic_recipe).not_to be_valid
    end

    it 'reports an error for the name attribute' do
      dynamic_recipe.valid?
      expect(dynamic_recipe.errors[:name]).to eq(['must be between 1 and 100 characters'])
    end
  end

  describe '.to_params' do
    it 'returns params useful for controllers' do
      expect(described_class.to_params).to(
        eq([
             :id,
             :client_id,
             :name,
             :owner_id,
             { blocks: [
               :id,
               :type,
               :parent_id,
               {
                 content: %i[
                   text
                   block_id
                   attachment_id
                 ],
               },
             ] },
           ]),
      )
    end
  end
end
