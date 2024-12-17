# frozen_string_literal: true

module Api
  module V1
    # Controller to handle ability actions
    class AbilityController < ApplicationController
      before_action :authenticate!, except: %i[show]

      def show
        user = User.find_by(client_id: params[:user_id]) if params[:user_id].present?
        render json: Ability.new(user), status: :ok
      end
    end
  end
end
