# frozen_string_literal: true

require 'rails_helper'

shared_examples_for 'client_id' do
  it 'sets the client_id attribute before create' do
    expect(subject.client_id).to be_nil
    subject.save
    expect(subject.client_id).to match(RegexUtil::UUID)
  end
end
