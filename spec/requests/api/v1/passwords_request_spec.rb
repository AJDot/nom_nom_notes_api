# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Passwords', type: :request do
  describe '#forgot' do
    context 'when email is not provided' do
      it 'returns email not found error' do
        put '/api/v1/password/forgot'
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:not_found)
        body = JSON.parse(response.body).deep_symbolize_keys
        expect(body).to eq(error: ['Email not found.'])
      end
    end

    context 'when email does not match an existing user' do
      it 'returns account not found error' do
        put '/api/v1/password/forgot', params: { email: 'philip.fry@planet-express.com' }
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:not_found)
        body = JSON.parse(response.body).deep_symbolize_keys
        expect(body).to eq(error: ['Account not found.'])
      end
    end

    context 'when email matches an existing user' do
      let(:user) { create(:user, :default) }

      it 'returns a no content status' do
        put '/api/v1/password/forgot', params: { email: user.email }
        expect(response.content_type).to eq(nil)
        expect(response).to have_http_status(:no_content)
        expect(response.body).to eq('')
      end

      it 'sends an email' do
        expect(Api::V1::PasswordMailer).to receive(:forgot).once.and_call_original
        expect { put '/api/v1/password/forgot', params: { email: user.email } }.to(
          change { ActionMailer::Base.deliveries.count }.by(1),
        )
      end
    end
  end
end
