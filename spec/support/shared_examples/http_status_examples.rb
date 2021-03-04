# frozen_string_literal: true

require_relative '../session_helper'

RSpec.shared_examples 'http status' do |status|
  let(:status) { status }

  it "returns http status #{status}" do
    expect(response).to have_http_status(status)
  end
end
