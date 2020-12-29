# typed: false
module Api
  module V1
    class RecipesController < ApplicationController
      before_action :authorize_access_request!, except: [:index, :show]
      before_action :build_recipe, only: [:create]
      before_action :set_recipe, only: [:show, :update, :destroy]

      def index
        @recipes = Recipe.all
        render json: @recipes, include: %w[steps ingredients categories recipe_categories]
      end

      def show
        render json: @recipe, include: %w[steps ingredients categories recipe_categories]
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
          render json: { error: @recipe.errors.full_messages.join(' ') }, status: :unprocessable_entity
        end
      end

      private

      def build_recipe
        @recipe = Recipe.new(recipe_params)
      end

      def set_recipe
        @recipe = Recipe.find_by(client_id: params[:id])
      end

      def recipe_params
        p = params.require(:recipe).permit(
          :id,
          :client_id,
          :name,
          :description,
          :cook_time,
          :note,
          :image,
          steps: [
            :id,
            :client_id,
            :_destroy,
            :description,
            :recipe_id,
            :sort_order,
          ],
          ingredients: [
            :id,
            :client_id,
            :_destroy,
            :description,
            :recipe_id,
            :sort_order,
          ],
          recipe_categories: [
            :id,
            :client_id,
            :_destroy,
            :recipe_id,
            :category_id,
          ],
        )

        Recipe.reflect_on_all_associations.each do |reflection|
          p["#{reflection.name}_attributes"] = p.delete(reflection.name) if p.has_key?(reflection.name)
        end

        p
      end
    end
  end
end
