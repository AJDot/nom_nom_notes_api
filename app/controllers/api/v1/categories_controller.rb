# frozen_string_literal: true

module Api
  module V1
    # Controller for Category model
    class CategoriesController < ApplicationController
      before_action :authorize_access_request!, except: [:index]
      before_action :build_category, only: [:create]

      def index
        @categories = Category
        if params[:query].present?
          @categories = @categories.where.not(query_params[:not]) if query_params[:not]
          @categories = @categories.search_by_name(query_params[:term])
        else
          @categories = @categories.all
        end
        render json: @categories, status: :ok
      end

      def create
        if @recipe.save
          render json: @recipe, status: :created
        else
          render json: { error: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def build_category
        @recipe = Category.new(category_params)
      end

      def category_params
        params.require(:category).permit(
          *Category.to_params,
        )
      end
    end
  end
end
