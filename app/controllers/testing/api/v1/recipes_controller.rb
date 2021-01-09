# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting Recipes
      class RecipesController < ApplicationController
        def create
          Recipe.create(params[:recipe].permit!)
          Recipe.create(params[:recipes].map(&:permit!))
          render status: :ok
        end
      end
    end
  end
end
