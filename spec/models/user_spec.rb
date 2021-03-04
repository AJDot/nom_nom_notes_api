# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    described_class.new(
      email: 'philip.fry@planet-express.com',
      password: 'ah123456',
      password_confirmation: 'ah123456',
      username: 'orangejoe',
    )
  end

  it_behaves_like 'client_id'

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a unique email' do
    create :user, :default, email: 'phil@fry.futurama'
    user.email = 'phil@fry.futurama'
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a password confirmation' do
    user.password_confirmation = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a username' do
    user.username = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a unique username' do
    create :user, :default, username: 'orangejoe'
    user.username = 'orangejoe'
    expect(user).not_to be_valid
  end
end
