# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting Users
      class UsersController < ApplicationController
        def create
          users = []
          users += create_users_from_params(params[:user])
          users += create_users_from_params(params[:users])
          render json: users, status: users.all?(&:valid?) ? :ok : :unprocessable_entity
        end

        private

        def create_users_from_params(*user_params)
          user_params.compact!
          if user_params
            Array.wrap(User.create(user_params.map(&:permit!)))
          else
            []
          end
        end
      end
    end
  end
end
