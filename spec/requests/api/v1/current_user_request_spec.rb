# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::CurrentUser', type: :request do
  describe '#show' do
    context 'when not signed in' do
      before do
        get '/api/v1/current_user'
      end

      include_examples 'content type', :json
      include_examples 'http status', :unauthorized
    end

    context 'when signed in' do
      subject(:user) { create(:user) }

      before do
        sign_in(user)
        get '/api/v1/current_user', headers: api_headers
      end

      include_examples 'content type', :json
      include_examples 'http status', :ok

      it 'returns the signed in user id that made the request' do
        expect(response.parsed_body['data']['id']).to eq(user.id)
      end

      it 'returns the signed in user client_id that made the request' do
        expect(response.parsed_body['data']['attributes']['clientId']).to eq(user.client_id)
      end
    end
  end
end
