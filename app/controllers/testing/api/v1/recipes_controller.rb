# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting Recipes
      class RecipesController < ApplicationController
        def create
          recipes = []
          recipes << Recipe.create(params[:recipe].permit!) if params[:recipe]
          recipes += Recipe.create(params[:recipes].map(&:permit!)) if params[:recipes]
          render json: recipes, status: :ok
        end
      end
    end
  end
end
