# frozen_string_literal: true

module Api
  module V1
    # Controller to handle current user actions
    class CurrentUserController < ApplicationController
      before_action :authenticate!

      def show
        user = current_user
        if current_user.present?
          render json: user, status: :ok
        else
          render status: :not_found
        end
      end
    end
  end
end
