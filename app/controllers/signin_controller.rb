# typed: strict
class SigninController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

  sig {void}
  def create
    user = User.find_by(email: params[:email])
    if user.present?
      if user.authenticate(T.cast(params[:password], T.nilable(String)))
        payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
        tokens = session.login

        response.set_cookie(JWTSessions.access_cookie,
                            value: tokens[:access],
                            httponly: true,
                            secure: Rails.env.production?)
        render json: { csrf: tokens[:csrf] }
      else
        not_authorized
      end
    else
      not_found
    end
  end

  sig {void}
  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end

  private

  sig {void}
  def not_found
    render json: { error: "Cannot find email/password combination" }, status: :not_found
  end
end
