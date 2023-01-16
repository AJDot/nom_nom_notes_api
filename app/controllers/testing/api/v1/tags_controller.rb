# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting Tags
      class TagsController < ApplicationController
        def create
          tags = []
          tags << Tag.create(params[:tag].permit!) if params[:tag].present?
          tags += Tag.create(params[:tags].map(&:permit!)) if params[:tags].present?
          render json: tags, status: :ok
        end
      end
    end
  end
end
