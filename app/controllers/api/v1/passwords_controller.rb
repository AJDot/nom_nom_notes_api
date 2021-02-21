# frozen_string_literal: true

module Api
  module V1
    # Handle forgetting and changing passwords
    class PasswordsController < ApplicationController
      before_action :authorize_access_request!, except: %i[forgot change]

      def forgot
        error = forgot_password_error
        return render error if error

        current_user.generate_password_token!
        Api::V1::PasswordMailer.forgot(
          email: params[:email],
          token: current_user.reset_password_token,
          origin_url: params[:origin_url],
        ).deliver_now
        render status: :no_content
      end

      private

      def change_password
        token = params[:token].to_s

        return render json: { error: 'Token not present' }, status: :unprocessable_entity if params[:email].blank?

        user = User.find_by(reset_password_token: token)

      def forgot_password_error
        return { json: { error: ['Email not found.'] }, status: :not_found } if params[:email].blank?

        self.current_user = user = User.find_by(email: params[:email])
        return { json: { error: ['Account not found.'] }, status: :not_found } if user.blank?

        nil
      end
    end
  end
end
