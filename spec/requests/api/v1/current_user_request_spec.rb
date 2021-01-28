# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::CurrentUser', type: :request do
  describe '#show' do
    context 'when not signed in' do
      it 'returns forbidden' do
        get '/api/v1/current_user'
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'when signed in' do
      subject { create(:user, :default) }
      before do
        sign_in(subject)
      end

      it 'returns the signed in user that made the request' do
        get '/api/v1/current_user', headers: session_headers
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body['data']['id']).to eq(subject.id)
        expect(response.parsed_body['data']['attributes']['clientId']).to eq(subject.client_id)
      end
    end
  end
end
