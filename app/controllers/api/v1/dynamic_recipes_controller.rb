# frozen_string_literal: true

module Api
  module V1
    # Controller to handle dynamic recipe actions
    class DynamicRecipesController < ApplicationController
      before_action :authorize_access_request!, except: %i[index show]
      before_action :build_dynamic_recipe, only: [:create]
      before_action :set_dynamic_recipe, only: %i[show update destroy]

      def index
        @recipes = Recipe.all
        render json: @dynamic_recipes, status: :ok
      end

      def show
        render json: @dynamic_recipe, include: []
      end

      def create
        if @dynamic_recipe.save
          render json: @dynamic_recipe, status: :created
        else
          render json: { error: @dynamic_recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @dynamic_recipe.update(dynamic_recipe_params)
          render json: @dynamic_recipe, status: :ok
        else
          render json: { error: @dynamic_recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @dynamic_recipe.destroy
          render json: @dynamic_recipe, status: :no_content
        else
          render json: { error: @dynamic_recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def build_dynamic_recipe
        @dynamic_recipe = DynamicRecipe.new(dynamic_recipe_params)
      end

      def set_dynamic_recipe
        @dynamic_recipe = DynamicRecipe.find_by(client_id: params[:id])
      end

      def dynamic_recipe_params
        p = params.require(:dynamic_recipe).permit(
          *DynamicRecipe.to_params,
        )

        DynamicRecipe.reflect_on_all_associations.each do |reflection|
          p["#{reflection.name}_attributes"] = p.delete(reflection.name) if p.key?(reflection.name)
        end

        p
      end
    end
  end
end
