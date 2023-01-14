# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::DynamicRecipes', type: :request do
  describe '#index' do
    before do
      create_list(:dynamic_recipe, 2)
      get '/api/v1/dynamic_recipes'
    end

    include_examples 'content type', :json
    include_examples 'http status', :ok

    it 'allows retrieving all dynamic recipes' do
      expect(response.parsed_body['data'].count).to eq(2)
    end
  end

  describe '#show' do
    subject(:dynamic_recipe) do
      create(:dynamic_recipe)
    end

    let(:user) { create(:user) }

    context 'when not signed in' do
      before do
        get "/api/v1/dynamic_recipes/#{dynamic_recipe.client_id}"
      end

      include_examples 'content type', :json
      include_examples 'http status', :ok

      it 'returns dynamic recipe data' do
        expect(response.parsed_body['data']['id']).to eq(dynamic_recipe.id)
      end
    end

    context 'when signed in' do
      before do
        sign_in(user)
        get "/api/v1/dynamic_recipes/#{dynamic_recipe.client_id}", headers: session_headers
      end

      include_examples 'content type', :json
      include_examples 'http status', :ok
    end
  end

  describe '#create' do
    let(:dynamic_recipe_params) do
      { dynamic_recipe: { name: 'My Dynamic Recipe', owner_id: user.client_id } }
    end
    let(:user) { create(:user) }

    context 'when not signed in' do
      before do
        post '/api/v1/dynamic_recipes', params: dynamic_recipe_params
      end

      include_examples 'content type', :json
      include_examples 'http status', :unauthorized
    end

    context 'when signed in' do
      before do
        sign_in(user)
      end

      context 'with valid data' do
        it 'creates a DynamicRecipe' do
          expect do
            post '/api/v1/dynamic_recipes', params: dynamic_recipe_params, headers: session_headers
          end.to change(DynamicRecipe, :count).by(1)
        end

        describe 'response' do
          before do
            post '/api/v1/dynamic_recipes', params: dynamic_recipe_params, headers: session_headers
          end

          include_examples 'content type', :json
          include_examples 'http status', :created
        end
      end

      context 'when error' do
        before do
          dynamic_recipe_params[:dynamic_recipe][:name] = ''
          post '/api/v1/dynamic_recipes', params: dynamic_recipe_params, headers: session_headers
        end

        include_examples 'content type', :json
        include_examples 'http status', :unprocessable_entity

        it 'returns an error' do
          expect(response.parsed_body).to have_key('error')
        end
      end
    end
  end

  describe '#update' do
    subject(:dynamic_recipe) { create(:dynamic_recipe, owner: user) }

    let(:user) { create(:user) }

    describe 'response' do
      before do
        dynamic_recipe.update(owner: user)
        patch "/api/v1/dynamic_recipes/#{dynamic_recipe.client_id}"
      end

      include_examples 'content type', :json
      include_examples 'http status', :unauthorized
    end

    context 'when signed in' do
      before do
        sign_in(user)
      end

      def make_request
        patch "/api/v1/dynamic_recipes/#{dynamic_recipe.client_id}",
              params: { dynamic_recipe: { name: 'Something else' } },
              headers: session_headers
      end

      context 'without owner' do
        before do
          dynamic_recipe.update(owner: nil)
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :forbidden
      end

      context 'with a different owner' do
        before do
          dynamic_recipe.update(owner: create(:user, email: 'another@email.edu', username: 'another'))
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :forbidden
      end

      describe 'response' do
        before do
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :ok
      end

      it 'can update the dynamic recipe name' do
        make_request
        expect(dynamic_recipe.reload.name).to eq('Something else')
      end

      context 'with error' do
        let!(:old_name) { dynamic_recipe.name }

        before do
          # create dynamic recipe so updating subject will result in name unique error
          create(:dynamic_recipe, name: 'Something else')
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :unprocessable_entity

        it 'does not update the dynamic recipe name' do
          expect(dynamic_recipe.reload.name).to eq(old_name)
        end
      end
    end
  end

  describe '#destroy' do
    subject!(:dynamic_recipe) { create(:dynamic_recipe, owner: user) }

    let(:user) { create(:user) }

    describe 'response' do
      before do
        delete "/api/v1/dynamic_recipes/#{dynamic_recipe.client_id}"
      end

      include_examples 'content type', :json
      include_examples 'http status', :unauthorized
    end

    context 'when signed in' do
      before do
        sign_in(user)
      end

      def make_request
        delete "/api/v1/dynamic_recipes/#{dynamic_recipe.client_id}", headers: session_headers
      end

      context 'without owner' do
        before do
          dynamic_recipe.update(owner: nil)
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :forbidden
      end

      context 'with a different owner' do
        before do
          dynamic_recipe.update(owner: create(:user, email: 'another@email.edu', username: 'another'))
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :forbidden
      end

      describe 'response' do
        before do
          make_request
        end

        include_examples 'content type', nil
        include_examples 'http status', :no_content
      end

      it 'removes a dynamic recipe from the database' do
        expect { make_request }.to change(DynamicRecipe, :count).by(-1)
      end

      context 'with error' do
        before do
          allow_any_instance_of(DynamicRecipe).to receive(:destroy).and_return(false)
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :unprocessable_entity
      end
    end
  end
end
