# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Categories', type: :request do
  describe '#index' do
    before do
      create(:category, name: 'AAA')
      create(:category, name: 'BB')
      create(:category, name: 'BBB')
      create(:category, name: 'CCC')
    end

    describe 'basic' do
      before do
        get '/api/v1/categories'
      end

      include_examples 'content type', :json
      include_examples 'http status', :ok

      it 'allows retrieving all categories' do
        expect(response.parsed_body['data'].count).to eq(4)
      end
    end

    context 'with query' do
      context 'with no categories selected' do
        before do
          get '/api/v1/categories', params: { query: { term: 'BBB' } }
        end

        include_examples 'content type', :json
        include_examples 'http status', :ok

        it 'returns the amount of categories that match name' do
          expect(response.parsed_body['data'].count).to eq(1)
        end

        it 'returns the categories that match name' do
          expect(response.parsed_body['data'].first['attributes']).to include({ 'name' => 'BBB' })
        end
      end

      context 'when excluding certain categories' do
        before do
          get '/api/v1/categories',
              params: {
                query: {
                  term: 'B',
                  not: {
                    client_id: [Category.find_by(name: 'BB').client_id],
                  },
                },
              }
        end

        include_examples 'content type', :json
        include_examples 'http status', :ok

        it 'returns the amount of categories that match name' do
          expect(response.parsed_body['data'].count).to eq(1)
        end

        it 'returns the categories that match name' do
          expect(response.parsed_body['data'].first['attributes']).to include({ 'name' => 'BBB' })
        end
      end
    end
  end
end
