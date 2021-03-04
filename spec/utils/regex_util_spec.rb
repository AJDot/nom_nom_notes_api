# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RegexUtil, type: :util do
  describe 'EMAIL' do
    it 'matches emails' do
      %w[a@a.a philip.fry@planet-express.com f.r.y@philip.net 2@fry.com].each do |text|
        expect(described_class::EMAIL).to match(text)
      end
    end

    it 'does not match non-emails' do
      %w[aa.a philip@frycom fry fry@philip.4 2@4.8].each do |text|
        expect(described_class::EMAIL).not_to match(text)
      end
    end
  end

  describe 'UUID' do
    let(:bad_uuids) do
      [
        # g is not a valid character
        'g84c8d96-e009-4a4d-a933-5dad120034fa',
        # too short
        '284c8d96-e009-4a4d-a933-5dad120034f',
        # too long
        '284c8d96-e009-4a4d-a933-5dad120034fab',
      ]
    end

    it 'matches UUIDs' do
      %w[284c8d96-e009-4a4d-a933-5dad120034fa 4d65b274-daf1-49c9-be90-120e53e2ca1a].each do |text|
        expect(described_class::UUID).to match(text)
      end
    end

    it 'does not match non-UUIDs' do
      bad_uuids.each do |text|
        expect(described_class::UUID).not_to match(text)
      end
    end
  end
end
