# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for affecting Users
      class UsersController < ApplicationController
        def create
          users = []
          users << User.create(params[:user].permit!) if params[:user]
          users += User.create(params[:users].map(&:permit!)) if params[:users]
          render json: users, status: :ok
        end
      end
    end
  end
end
