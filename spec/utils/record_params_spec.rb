# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecordParams, type: :util do
  describe '#to_params' do
    it 'simply returns the keys' do
      params = described_class.new(:id, :client_id)
      expect(params.to_params).to eq(%i[id client_id])
    end
  end
end
