# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting Categories
      class CategoriesController < ApplicationController
        def create
          categories = []
          categories << Category.create(params[:category].permit!) if params[:category]
          categories += Category.create(params[:categories].map(&:permit!)) if params[:categories]
          render json: categories, status: :ok
        end
      end
    end
  end
end
