# frozen_string_literal: true

module Api
  module V1
    # Controller to handle current user actions
    class CurrentUserController < ApplicationController
      before_action :authorize_access_request!

      def show
        user = User.find_by(id: payload['user_id'])
        if user.present?
          render json: user, status: :ok
        else
          render status: :not_found
        end
      end
    end
  end
end
