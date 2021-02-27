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

      def change
        error = change_password_error
        return render error if error

        change_password
      end

      private

      def forgot_password_error
        return { json: { error: ['Email not found.'] }, status: :not_found } if params[:email].blank?

        self.current_user = user = User.find_by(email: params[:email])
        return { json: { error: ['Account not found.'] }, status: :not_found } if user.blank?

        nil
      end

      def change_password_error
        token = params[:token].to_s

        return { json: { error: 'Token not present' }, status: :unprocessable_entity } if token.blank?

        self.current_user = user = User.find_by(reset_password_token: token)

        unless user.present? && user.password_token_valid?
          return { json: { error: ['Link not valid or expired.'] }, status: :not_found }
        end

        nil
      end

      def change_password
        unless current_user.reset_password!(params[:password], params[:password_confirmation])
          return render json: { error: current_user.errors.full_messages }, status: :unprocessable_entity
        end

        render status: :ok
      end
    end
  end
end
