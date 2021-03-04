# frozen_string_literal: true

require_relative '../session_helper'

RSpec.shared_examples 'content type' do |type|
  let(:type) { type }

  it 'returns json content type' do
    expect(response.content_type).to eq(content_type_map[type])
  end
end
