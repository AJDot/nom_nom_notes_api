# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tagging, type: :model do
  subject(:tagging) do
    described_class.new(
      taggable: create(:recipe),
      tag: create(:tag),
    )
  end

  it_behaves_like 'client_id'

  it 'is valid with valid attributes' do
    expect(tagging).to be_valid
  end

  it 'is not valid without a taggable' do
    tagging.taggable = nil
    expect(tagging).not_to be_valid
  end

  it 'is not valid without a tag' do
    tagging.tag = nil
    expect(tagging).not_to be_valid
  end

  describe '.to_params' do
    it 'returns params useful for controllers' do
      expect(described_class.to_params).to(
        eq(
          %i[
            id
            client_id
            _destroy
            tag_id
            taggable_id
            taggable_type
          ],
        ),
      )
    end
  end
end
