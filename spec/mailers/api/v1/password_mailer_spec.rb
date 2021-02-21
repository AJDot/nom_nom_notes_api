# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PasswordMailer, type: :mailer do
  describe '#forgot' do
    let(:mail) do
      described_class.forgot(email: 'philip.fry@planet-express.com', token: 'abcd', origin_url: 'localhost:3000')
    end

    it 'renders the subject' do
      expect(mail.subject).to eq('Password Reset Requested')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['philip.fry@planet-express.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['support@one-guy.com'])
    end

    it 'renders the greeting' do
      expect(mail.body.encoded).to match('Hello philip.fry@planet-express.com')
    end

    it 'renders the main message' do
      expect(mail.body.encoded).to match('A request has been made to change your password')
    end

    it 'renders the change password link' do
      expect(mail.body.encoded).to match('Follow this link to change your password: localhost:3000\?token=abcd')
    end

    it 'renders the footer' do
      expect(mail.body.encoded).to match('If you did not make this request, '\
        'ignore this email. Your password can only be changed through the link in this email.')
    end
  end
end
