# frozen_string_literal: true

# Wrapper around JWTSessions for signing in/out/up
class SessionUtil
  attr_reader :tokens

  def build_session(payload)
    @session = JWTSessions::Session.new(
      payload:,
      refresh_by_access_allowed: true,
    )
  end

  def login
    @tokens = @session.login
  end

  def refresh(&)
    @tokens = @session.refresh_by_access_payload(&)
  end

  def set_cookie(response, tokens = @tokens)
    response.set_cookie(
      JWTSessions.access_cookie,
      value: tokens[:access],
      httponly: true,
      secure: Rails.env.production?,
      same_site: Rails.env.production? ? 'None' : 'Lax',
    )
  end
end
