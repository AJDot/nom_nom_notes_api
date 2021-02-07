# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting Recipes
      class FeaturesController < ApplicationController
        def create
          feature = Features::Service.new.enable(params[:key].to_sym)
          render json: feature, status: :ok
        end

        def destroy
          feature = Features::Service.new.disable(params[:id].to_sym)
          render json: feature, status: :ok
        end
      end
    end
  end
end
