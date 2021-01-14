# frozen_string_literal: true

require 'rails_helper'
require_relative 'concerns/client_id_spec'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      email: 'a@a.a',
      password: 'ah123456',
      password_confirmation: 'ah123456',
    )
  end

  it_behaves_like 'client_id'

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password confirmation' do
    subject.password_confirmation = nil
    expect(subject).to_not be_valid
  end
end
