# frozen_string_literal: true

# Handles refreshing an expired session
class RefreshController < ApplicationController
  before_action :authorize_refresh_by_access_request!

  def create
    refresh
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end

  private

  def refresh
    sess_util = SessionUtil.new
    sess_util.build_session(claimless_payload)
    sess_util.refresh do
      raise JWTSessions::Errors::Unauthorized, 'Unable to refresh session!'
    end
    sess_util.set_cookie(response)
    render json: { csrf: sess_util.tokens[:csrf] }
  end
end
