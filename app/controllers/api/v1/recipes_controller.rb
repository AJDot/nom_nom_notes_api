module Api
  module V1
    class RecipesController < ApplicationController
      before_action :authorize_access_request!, except: [:index, :show]
      before_action :set_recipe, only: [:show]

      def index
        @recipes = Recipe.all
        render json: @recipes
      end

      def show
        render json: @recipe
      end

      private

      def set_recipe
        @recipe = Recipe.find(params[:id])
      end
    end
  end
end
