# frozen_string_literal: true

module Api
  module V1
    # Controller for Tag model
    class TagsController < ApplicationController
      before_action :authorize_access_request!, except: [:index]
      before_action :build_tag, only: [:create]

      def index
        @tags = Tag
        if params[:query].present?
          @tags = @tags.where.not(query_params[:not]) if query_params[:not]
          @tags = @tags.search_by_name(query_params[:term])
        else
          @tags = @tags.all
        end
        render json: @tags, status: :ok
      end

      def create
        if @recipe.save
          render json: @recipe, status: :created
        else
          render json: { error: @recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def build_tag
        @recipe = Tag.new(tag_params)
      end

      def tag_params
        params.require(:tag).permit(
          *Tag.to_params,
        )
      end
    end
  end
end
