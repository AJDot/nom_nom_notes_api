# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Tags', type: :request do
  describe '#index' do
    before do
      create(:tag, name: 'AAA')
      create(:tag, name: 'BB')
      create(:tag, name: 'BBB')
      create(:tag, name: 'CCC')
    end

    describe 'basic' do
      before do
        get '/api/v1/tags'
      end

      include_examples 'content type', :json
      include_examples 'http status', :ok

      it 'allows retrieving all tags' do
        expect(response.parsed_body['data'].count).to eq(4)
      end
    end

    context 'with query' do
      context 'with no tags selected' do
        before do
          get '/api/v1/tags', params: { query: { term: 'BBB' } }
        end

        include_examples 'content type', :json
        include_examples 'http status', :ok

        it 'returns the amount of tags that match name' do
          expect(response.parsed_body['data'].count).to eq(1)
        end

        it 'returns the tags that match name' do
          expect(response.parsed_body['data'].first['attributes']).to include({ 'name' => 'BBB' })
        end
      end

      context 'when excluding certain tags' do
        before do
          get '/api/v1/tags',
              params: {
                query: {
                  term: 'B',
                  not: {
                    client_id: [Tag.find_by(name: 'BB').client_id],
                  },
                },
              }
        end

        include_examples 'content type', :json
        include_examples 'http status', :ok

        it 'returns the amount of tags that match name' do
          expect(response.parsed_body['data'].count).to eq(1)
        end

        it 'returns the tags that match name' do
          expect(response.parsed_body['data'].first['attributes']).to include({ 'name' => 'BBB' })
        end
      end
    end
  end
end
