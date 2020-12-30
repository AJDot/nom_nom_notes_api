# frozen_string_literal: true

# Wrapper around JWTSessions for signing in/out/up
class SessionUtil
  attr_reader :tokens

  def build_session(payload)
    @session = JWTSessions::Session.new(
      payload: payload,
      refresh_by_access_allowed: true
    )
  end

  def login
    @tokens = @session.login
  end

  def set_cookie(response, tokens)
    response.set_cookie(
      JWTSessions.access_cookie,
      value: tokens[:access],
      httponly: true,
      secure: Rails.env.production?
    )
  end
end
