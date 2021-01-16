# frozen_string_literal: true

# Handles signing in using JWTSessions
class SigninController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

  def create
    user = User.find_by(email: params[:email])
    if user.present?
      authenticate_and_sign_in(user)
    else
      handle_errors
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
    if params[:password].blank?
      blank_password
    elsif user.authenticate(params[:password])
      sign_in(user)
    else
      not_authorized
    end
  end

  def blank_email
    render json: { error: 'Email can\'t be blank' }, status: :unprocessable_entity
  end

  def invalid_email
    render json: { error: 'Email is invalid' }, status: :unprocessable_entity
  end

  def blank_password
    render json: { error: 'Password can\'t be blank' }, status: :unprocessable_entity
  end

  def handle_errors
    if params[:email].blank?
      blank_email
    elsif !params[:email].match?(RegexUtil::EMAIL)
      invalid_email
    else
      not_found
    end
  end

  def sign_in(user)
    sess_util = SessionUtil.new
    sess_util.build_session({ user_id: user.id })
    sess_util.login
    sess_util.set_cookie(response)
    render json: { csrf: sess_util.tokens[:csrf] }
  end
end
