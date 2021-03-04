# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CookTime, type: :util do
  describe '#new' do
    let(:cook_time) { described_class.new('17:06') }

    it 'parses hours' do
      expect(cook_time.hours).to eq('17')
    end

    it 'parses minutes' do
      expect(cook_time.minutes).to eq('6')
    end

    it 'parses hours and minutes' do
      expect(cook_time.interval).to eq('17:06')
    end
  end

  describe '#blank?' do
    it 'returns false if minutes are non-zero' do
      cook_time = described_class.new('00:00')
      expect(cook_time.blank?).to be true
    end

    it 'returns false if hours are non-zero' do
      cook_time = described_class.new('00:01')
      expect(cook_time.blank?).to be false
    end

    it 'returns true if minutes and hours are 0' do
      cook_time = described_class.new('01:00')
      expect(cook_time.blank?).to be false
    end
  end
end
