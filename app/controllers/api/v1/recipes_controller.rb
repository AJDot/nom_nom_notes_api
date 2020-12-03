module Api
  module V1
    class RecipesController < ApplicationController
      def index
        render json: { recipes: Recipe.all }
      end

      def show
        render json: { recipe: Recipe.find(params[:id]) }
      end
    end
  end
end
