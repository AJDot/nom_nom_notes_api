# frozen_string_literal: true

require 'rails_helper'
require_relative 'concerns/client_id_spec'

RSpec.describe Recipe, type: :model do
  subject do
    described_class.new(
      name: 'A Recipe',
    )
  end

  it_behaves_like 'client_id'

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
    expect(subject.errors[:name]).to eq(['must be between 1 and 100 characters'])
  end

  it 'is not valid without a unique name' do
    described_class.create(name: 'A Recipe')
    expect(subject).to_not be_valid
    expect(subject.errors[:name]).to eq(['must be unique'])
  end

  it 'is not valid without a valid length name' do
    subject.name = 'a' * 101
    expect(subject).to_not be_valid
    expect(subject.errors[:name]).to eq(['must be between 1 and 100 characters'])
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
