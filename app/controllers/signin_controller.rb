# frozen_string_literal: true

# Handles signing in using JWTSessions
class SigninController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

  def create
    user = User.find_by(email: params[:email])
    if user.present?
      authenticate_and_sign_in(user)
    else
      not_found
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end

  private

  def not_found
    render json: { error: 'Cannot find email/password combination' }, status: :not_found
  end

  def authenticate_and_sign_in(user)
    if user.authenticate(params[:password])
      sess_util = SessionUtil.new
      sess_util.build_session({ user_id: user.id })
      sess_util.login
      sess_util.set_cookie(response)
      render json: { csrf: sess_util.tokens[:csrf] }
    else
      not_authorized
    end
  end
end
