# frozen_string_literal: true

module Testing
  module Api
    module V1
      # Internal test api for handling passwords
      class PasswordsController < ApplicationController
        def forgot
          user = User.find_by(email: params[:email])
          user.generate_password_token!
          ::Api::V1::PasswordMailer.forgot(
            email: user.email,
            token: user.reset_password_token,
            origin_url: params[:origin_url],
          ).deliver_now
          render json: { token: user.reset_password_token }, status: :ok
        end
      end
    end
  end
end
