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

  describe '#change' do
    let(:user) { create(:user, :default) }
    let(:new_password) {'fa0s98hi2nj3k4'}
    let(:params) do
      {
        token: user.reset_password_token,
        password: new_password,
        password_confirmation: new_password,
      }
    end

    before do
      user.generate_password_token!
    end

    it 'changes the password when valid data is provided' do
      expect do
        put '/api/v1/password/change', params: params
      end.to(
        change { user.reload.password_digest },
      )
    end

    it 'does not change the password when password and confirmation are blank' do
      params.delete(:password)
      params.delete(:password_confirmation)
      expect do
        put '/api/v1/password/change', params: params
      end.to_not(
        change { user.reload.password_digest },
      )
    end

    it 'does not change the password when password and confirmation do not match' do
      params[:password_confirmation] = params[:password_confirmation] + '1'
      expect do
        put '/api/v1/password/change', params: params
      end.to_not(
        change { user.reload.password_digest },
      )
    end

    it 'does not change the password when token is expired' do
      user.update(reset_password_sent_at: Time.now - 4.hours - 1.minute) # expiration is 4 hours

      expect do
        put '/api/v1/password/change', params: params
      end.to_not(
        change { user.reload.password_digest },
      )
    end

    it 'does not change the password when token does not match any user' do
      params[:token] = 'randomness'
      expect do
        put '/api/v1/password/change', params: params
      end.to_not(
        change { user.reload.password_digest },
      )
    end
  end
end
