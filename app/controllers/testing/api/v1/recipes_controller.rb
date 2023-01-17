# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting Recipes
      class RecipesController < ApplicationController
        def index
          render json: Recipe.all, status: :ok
        end

        def create
          recipes_data = []
          recipes_data << params[:recipe].permit! if params[:recipe].present?
          recipes_data += params[:recipes].map(&:permit!) if params[:recipes].present?
          recipes = Recipe.create(recipes_data)
          render json: recipes, status: recipes.all?(&:valid?) ? :ok : :unprocessable_entity
        end
      end
    end
  end
end
