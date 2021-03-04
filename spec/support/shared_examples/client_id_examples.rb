# frozen_string_literal: true

require 'rails_helper'

shared_examples_for 'client_id' do
  it 'sets the client_id attribute before create' do
    expect { subject.save }.to(change(subject, :client_id).from(nil).to(match(RegexUtil::UUID)))
  end
end
