# frozen_string_literal: true

module Api
  module V1
    # Controller for Category model
    class CategoriesController < ApplicationController
      before_action :authorize_access_request!, except: [:index]

      def index
        @categories = Category
        if params[:query].present?
          @categories = @categories.where.not(query_params[:not]) if query_params[:not]
          @categories = @categories.search_by_name(query_params[:term])
        else
          @categories = @categories.all
        end
        render json: @categories
      end
    end
  end
end
