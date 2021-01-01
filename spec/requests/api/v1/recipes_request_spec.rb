# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Recipes', type: :request do
  describe '#index' do
    before do
      2.times { create(:recipe, :default) }
    end

    it 'allows retrieving all recipes' do
      get '/api/v1/recipes'
      expect(response.content_type).to eq(json_content_type)
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body['data'].count).to eq(2)
    end
  end

  describe '#show' do
    subject do
      create(:recipe, :default)
    end

    it 'allows viewing the recipe' do
      get "/api/v1/recipes/#{subject.client_id}"
      expect(response.content_type).to eq(json_content_type)
      expect(response).to have_http_status(:ok)
    end

    it 'returns recipe data with related data' do
      ing = create(:ingredient, :default, recipe: subject)
      step = create(:step, :default, recipe: subject)
      cat = create(:category, :default, recipes: [subject])
      rec_cat = RecipeCategory.first
      get "/api/v1/recipes/#{subject.client_id}"
      incs = response.parsed_body['included']
      client_ids = incs.map { |x| x['attributes']['clientId'] }
      expect(client_ids).to include(ing.client_id, step.client_id, cat.client_id, rec_cat.client_id)
    end

    context 'when signed in' do
      it 'allows viewing the recipe' do
        sign_in(create(:user, :default))
        get "/api/v1/recipes/#{subject.client_id}", headers: session_headers
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#create' do
    let(:recipe_params) do
      { recipe: { name: 'My Recipe' } }
    end

    it 'forbids creating a recipe' do
      post '/api/v1/recipes', params: recipe_params
      expect(response.content_type).to eq(json_content_type)
      expect(response).to have_http_status(:forbidden)
    end

    context 'when signed in' do
      before do
        sign_in(create(:user, :default))
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

  describe '#update' do
    subject { create(:recipe, :default) }

    it 'forbids updating a recipe' do
      patch "/api/v1/recipes/#{subject.client_id}"
      expect(response.content_type).to eq(json_content_type)
      expect(response).to have_http_status(:forbidden)
    end

    context 'when signed in' do
      before do
        sign_in(create(:user, :default))
      end

      def make_request
        patch "/api/v1/recipes/#{subject.client_id}",
              params: { recipe: { name: 'Something else' } },
              headers: session_headers
      end

      it 'allows updating a recipe' do
        make_request
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:ok)
        expect(subject.reload.name).to eq('Something else')
      end

      it 'reports errors if there are any' do
        # create recipe so updating subject will result in name unique error
        old_name = subject.name
        create(:recipe, :default, name: 'Something else')
        make_request
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(subject.reload.name).to eq(old_name)
      end

      context 'with relational data' do
        it 'allows updating relationships' do
          ing_client_id = SecureRandom.uuid
          step_1_client_id = SecureRandom.uuid
          step_2_client_id = SecureRandom.uuid
          cat = create(:category, :default)
          patch "/api/v1/recipes/#{subject.client_id}",
                params: {
                  recipe: {
                    name: 'Something else',
                    ingredients: [
                      {
                        client_id: ing_client_id,
                        description: 'An ingredient',
                        recipe_id: subject.client_id,
                      },
                    ],
                    steps: [
                      {
                        client_id: step_1_client_id,
                        description: 'Step 1',
                        recipe_id: subject.client_id,
                      },
                      {
                        client_id: step_2_client_id,
                        description: 'Step 2',
                        recipe_id: subject.client_id,
                      },
                    ],
                    recipe_categories: [
                      {
                        client_id: SecureRandom.uuid,
                        recipe_id: subject.client_id,
                        category_id: cat.client_id,
                      },
                    ],
                  },
                },
                headers: session_headers
          expect(response.content_type).to eq(json_content_type)
          expect(response).to have_http_status(:ok)
          expect(Ingredient.first.as_json.slice('client_id', 'description', 'recipe_id')).to(
            eq(
              {
                'client_id' => ing_client_id,
                'description' => 'An ingredient',
                'recipe_id' => subject.client_id,
              },
            ),
          )
          expect(Step.first.as_json.slice('client_id', 'description', 'recipe_id')).to(
            eq(
              {
                'client_id' => step_1_client_id,
                'description' => 'Step 1',
                'recipe_id' => subject.client_id,
              },
            ),
          )
          expect(Step.second.as_json.slice('client_id', 'description', 'recipe_id')).to(
            eq(
              {
                'client_id' => step_2_client_id,
                'description' => 'Step 2',
                'recipe_id' => subject.client_id,
              },
            ),
          )
          expect(RecipeCategory.first.as_json.slice('category_id', 'recipe_id')).to(
            eq(
              {
                'category_id' => cat.client_id,
                'recipe_id' => subject.client_id,
              },
            ),
          )
        end
      end
    end
  end

  describe '#destroy' do
    subject { create(:recipe, :default) }

    it 'forbids destroying a recipe' do
      delete "/api/v1/recipes/#{subject.client_id}"
      expect(response.content_type).to eq(json_content_type)
      expect(response).to have_http_status(:forbidden)
    end

    context 'when signed in' do
      before do
        sign_in(create(:user, :default))
      end

      def make_request
        delete "/api/v1/recipes/#{subject.client_id}", headers: session_headers
      end

      it 'allows destroying a recipe' do
        make_request
        expect(response.content_type).to be_nil
        expect(response).to have_http_status(:no_content)
      end

      it 'reports errors when unable to delete recipe' do
        allow_any_instance_of(Recipe).to receive(:destroy).and_return(false)
        make_request
        expect(response.content_type).to eq(json_content_type)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
