module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :authorize_access_request!

      def index
        @categories = Category
        @categories = @categories.where.not(query_params[:not]) if query_params[:not]
        @categories = @categories.search_by_name(query_params[:term])
        render json: @categories
      end
    end
  end
end
