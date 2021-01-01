# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CookTime, type: :util do
  describe '#new' do
    it 'parses hours and minutes' do
      cook_time = described_class.new('17:06')
      expect(cook_time.hours).to eq('17')
      expect(cook_time.minutes).to eq('6')
      expect(cook_time.interval).to eq('17:06')
    end
  end

  describe '#blank?' do
    it 'returns true if minutes and hours are 0' do
      cook_time = described_class.new('00:00')
      expect(cook_time.blank?).to be true
      cook_time = described_class.new('00:01')
      expect(cook_time.blank?).to be false
      cook_time = described_class.new('01:00')
      expect(cook_time.blank?).to be false
    end
  end
end
