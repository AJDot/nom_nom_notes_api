# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Recipes', type: :request do
  describe '#create' do
    let(:recipe_params) do
      { recipe: { name: 'My Recipe' } }
    end

    context 'when signed out' do
      it 'forbids creating a recipe' do
        post '/api/v1/recipes', params: recipe_params
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'when signed in' do
      before do
        user = create(:user, :default)
        sign_in(user.slice(:email, :password))
      end

      it 'creates a Recipe' do
        post '/api/v1/recipes', params: recipe_params, headers: session_headers

        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:created)
      end

      it 'returns an error when unable to create recipe' do
        recipe_params[:recipe][:name] = ''
        post '/api/v1/recipes', params: recipe_params, headers: session_headers
        expect(response.parsed_body).to have_key('error')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
