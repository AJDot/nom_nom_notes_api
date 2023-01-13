# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Recipes', type: :request do
  describe '#index' do
    before do
      create_list(:recipe, 2)
      get '/api/v1/recipes'
    end

    include_examples 'content type', :json
    include_examples 'http status', :ok

    it 'allows retrieving all recipes' do
      expect(response.parsed_body['data'].count).to eq(2)
    end
  end

  describe '#show' do
    subject(:recipe) do
      create(:recipe)
    end

    let(:user) { create(:user) }

    let!(:ing) { create(:ingredient, recipe:) }
    let!(:step) { create(:step, recipe:) }
    let!(:cat) { create(:category, recipes: [recipe]) }

    context 'when not signed in' do
      before do
        get "/api/v1/recipes/#{recipe.client_id}"
      end

      include_examples 'content type', :json
      include_examples 'http status', :ok

      it 'returns recipe data with related data' do
        rec_cat = RecipeCategory.first
        incs = response.parsed_body['included']
        client_ids = incs.map { |x| x['attributes']['clientId'] }
        expect(client_ids).to include(ing.client_id, step.client_id, cat.client_id, rec_cat.client_id)
      end
    end

    context 'when signed in' do
      before do
        sign_in(user)
        get "/api/v1/recipes/#{recipe.client_id}", headers: session_headers
      end

      include_examples 'content type', :json
      include_examples 'http status', :ok
    end
  end

  describe '#create' do
    let(:recipe_params) do
      { recipe: { name: 'My Recipe', owner_id: user.client_id } }
    end
    let(:user) { create(:user) }

    context 'when not signed in' do
      before do
        post '/api/v1/recipes', params: recipe_params
      end

      include_examples 'content type', :json
      include_examples 'http status', :unauthorized
    end

    context 'when signed in' do
      before do
        sign_in(user)
      end

      context 'with valid data' do
        it 'creates a Recipe' do
          expect do
            post '/api/v1/recipes', params: recipe_params, headers: session_headers
          end.to change(Recipe, :count).by(1)
        end

        describe 'response' do
          before do
            post '/api/v1/recipes', params: recipe_params, headers: session_headers
          end

          include_examples 'content type', :json
          include_examples 'http status', :created
        end
      end

      context 'when error' do
        before do
          recipe_params[:recipe][:name] = ''
          post '/api/v1/recipes', params: recipe_params, headers: session_headers
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
    subject(:recipe) { create(:recipe, owner: user) }

    let(:user) { create(:user) }

    describe 'response' do
      before do
        recipe.update(owner: user)
        patch "/api/v1/recipes/#{recipe.client_id}"
      end

      include_examples 'content type', :json
      include_examples 'http status', :unauthorized
    end

    context 'when signed in' do
      before do
        sign_in(user)
      end

      def make_request
        patch "/api/v1/recipes/#{recipe.client_id}",
              params: { recipe: { name: 'Something else' } },
              headers: session_headers
      end

      context 'without owner' do
        before do
          recipe.update(owner: nil)
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :forbidden
      end

      context 'with a different owner' do
        before do
          recipe.update(owner: create(:user, email: 'another@email.edu', username: 'another'))
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

      it 'can update the recipe name' do
        make_request
        expect(recipe.reload.name).to eq('Something else')
      end

      context 'with error' do
        let!(:old_name) { recipe.name }

        before do
          # create recipe so updating subject will result in name unique error
          create(:recipe, name: 'Something else')
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :unprocessable_entity

        it 'does not update the recipe name' do
          expect(recipe.reload.name).to eq(old_name)
        end
      end

      context 'with relational data' do
        let(:params) do
          {
            recipe: {
              name: 'Something else',
              owner_id: user.client_id,
              ingredients: [
                {
                  client_id: ing_client_id,
                  description: 'An ingredient',
                  recipe_id: recipe.client_id,
                },
              ],
              steps: [
                {
                  client_id: step_1_client_id,
                  description: 'Step 1',
                  recipe_id: recipe.client_id,
                },
                {
                  client_id: step_2_client_id,
                  description: 'Step 2',
                  recipe_id: recipe.client_id,
                },
              ],
              recipe_categories: [
                {
                  client_id: SecureRandom.uuid,
                  recipe_id: recipe.client_id,
                  category_id: cat.client_id,
                },
              ],
            },
          }
        end
        let(:cat) { create(:category) }
        let(:ing_client_id) { SecureRandom.uuid }
        let(:step_1_client_id) { SecureRandom.uuid }
        let(:step_2_client_id) { SecureRandom.uuid }

        before do
          patch "/api/v1/recipes/#{recipe.client_id}", params:, headers: session_headers
        end

        include_examples 'content type', :json
        include_examples 'http status', :ok

        it 'allows updating ingredients' do
          expect(Ingredient.first.as_json.slice('client_id', 'description', 'recipe_id')).to(
            eq({ 'client_id' => ing_client_id,
                 'description' => 'An ingredient',
                 'recipe_id' => recipe.client_id, }),
          )
        end

        it 'allows updating steps' do
          expect(Step.all[0..1].map { |x| x.as_json.slice('client_id', 'description', 'recipe_id') }).to(
            eq([
                 {
                   'client_id' => step_1_client_id,
                   'description' => 'Step 1',
                   'recipe_id' => recipe.client_id,
                 },
                 {
                   'client_id' => step_2_client_id,
                   'description' => 'Step 2',
                   'recipe_id' => recipe.client_id,
                 },
               ]),
          )
        end

        it 'allows updating categories' do
          expect(RecipeCategory.first.as_json.slice('category_id', 'recipe_id')).to(
            eq(
              {
                'category_id' => cat.client_id,
                'recipe_id' => recipe.client_id,
              },
            ),
          )
        end
      end
    end
  end

  describe '#destroy' do
    subject!(:recipe) { create(:recipe, owner: user) }

    let(:user) { create(:user) }

    describe 'response' do
      before do
        delete "/api/v1/recipes/#{recipe.client_id}"
      end

      include_examples 'content type', :json
      include_examples 'http status', :unauthorized
    end

    context 'when signed in' do
      before do
        sign_in(user)
      end

      def make_request
        delete "/api/v1/recipes/#{recipe.client_id}", headers: session_headers
      end

      describe 'response' do
        before do
          make_request
        end

        include_examples 'content type', nil
        include_examples 'http status', :no_content
      end

      it 'removes a recipe from the database' do
        expect { make_request }.to change(Recipe, :count).by(-1)
      end

      context 'with error' do
        before do
          allow_any_instance_of(Recipe).to receive(:destroy).and_return(false)
          make_request
        end

        include_examples 'content type', :json
        include_examples 'http status', :unprocessable_entity
      end
    end
  end
end
