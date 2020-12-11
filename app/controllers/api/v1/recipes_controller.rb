module Api
  module V1
    class RecipesController < ApplicationController
      before_action :authorize_access_request!, except: [:index, :show]
      before_action :build_recipe, only: [:create]
      before_action :set_recipe, only: [:show, :update, :destroy]

      def index
        @recipes = Recipe.all
        render json: @recipes
      end

      def show
        render json: @recipe
      end

      def create
        if @recipe.save
          render json: @recipe
        else
          render json: { error: @recipe.errors.full_messages.join(' ') }, status: :unprocessable_entity
        end
      end

      def update
        if @recipe.update(recipe_params)
          render json: @recipe
        else
          render json: { error: @recipe.errors.full_messages.join(' ') }, status: :unprocessable_entity
        end
      end

      def destroy
        if @recipe.destroy
          render json: @recipe
        else
          render json: {error: @recipe.errors.full_messages.join(' ')}, status: :unprocessable_entity
        end
      end

      private

      def build_recipe
        @recipe = Recipe.new(recipe_params)
      end

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end

      def recipe_params
        params.require(:recipe).permit(:name, :description, :note)
      end
    end
  end
end
