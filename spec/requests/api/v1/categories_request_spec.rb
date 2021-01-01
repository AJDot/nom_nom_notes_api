# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Categories', type: :request do
  describe '#index' do
    before do
      create(:category, :default, name: 'AAA')
      create(:category, :default, name: 'BB')
      create(:category, :default, name: 'BBB')
      create(:category, :default, name: 'CCC')
    end

    it 'allows retrieving all categories' do
      get '/api/v1/categories'
      expect(response.content_type).to eq(json_content_type)
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body['data'].count).to eq(4)
    end

    context 'with query' do
      it 'searches by name of category' do
        get '/api/v1/categories', params: { query: { term: 'BBB' } }
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body['data'].count).to eq(1)
        expect(response.parsed_body['data'].first['attributes']).to include({ 'name' => 'BBB' })
      end

      it 'can exclude client_ids when searching' do
        get '/api/v1/categories',
            params: {
              query: {
                term: 'B',
                not: {
                  client_id: [Category.find_by(name: 'BB').client_id],
                },
              },
            }
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:ok)
        expect(response.parsed_body['data'].count).to eq(1)
        expect(response.parsed_body['data'].first['attributes']).to include({ 'name' => 'BBB' })
      end
    end
  end
end
