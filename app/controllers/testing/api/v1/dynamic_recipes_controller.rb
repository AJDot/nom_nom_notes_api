# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting DynamicRecipes
      class DynamicRecipesController < ApplicationController
        def index
          render json: DynamicRecipe.all, include: %w[attachments], status: :ok
        end

        def create
          dynamic_recipes_data = []
          dynamic_recipes_data << params[:dynamic_recipe].permit! if params[:dynamic_recipe]
          dynamic_recipes_data += params[:dynamic_recipes].map(&:permit!) if params[:dynamic_recipes]
          dynamic_recipes = DynamicRecipe.create(dynamic_recipes_data)
          render json: dynamic_recipes, status: dynamic_recipes.all?(&:valid?) ? :ok : :unprocessable_entity
        end
      end
    end
  end
end
