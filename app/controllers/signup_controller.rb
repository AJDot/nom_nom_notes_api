# frozen_string_literal: true

# Handles signing up on the site
# Creates user and session upon success
class SignupController < ApplicationController
  def create
    if FeatureService.enabled?(:signup)
      user = User.new(user_params)
      if user.save
        authenticate_and_sign_up(user)
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: '', message: ''}, status: :forbidden
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :username)
  end

  def authenticate_and_sign_up(user)
    sess_util = SessionUtil.new
    sess_util.build_session({ user_id: user.id })
    sess_util.login
    sess_util.set_cookie(response)
    render json: { csrf: sess_util.tokens[:csrf] }, status: :created
  end
end
