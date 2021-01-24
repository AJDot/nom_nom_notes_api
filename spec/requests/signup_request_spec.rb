# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Signups', type: :request do
  describe '#create' do
    let(:signup_params) do
      {
        email: 'philip.fry@planet-express.com',
        password: 'ah123456',
        password_confirmation: 'ah123456',
        username: 'orangejoe',
      }
    end

    it 'allows user creation with valid params' do
      expect do
        post '/signup', params: signup_params
      end.to(change { User.count }.by(1))

      expect(response.content_type).to eq(json_content_type)
      expect(response).to have_http_status(:created)
    end

    it 'does not allow signup without valid username' do
      signup_params[:username] = nil
      expect do
        post '/signup', params: signup_params
      end.to_not(change { User.count })

      expect(response.content_type).to eq(json_content_type)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
