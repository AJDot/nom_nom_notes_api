# frozen_string_literal: true

module NomNomNotesApi
  # Extension of basic authentication
  # Use for admin features such as feature flipper
  # API authentication is done with JWTSessions
  class AdminAuth < Rack::Auth::Basic
    def call(env)
      request = Rack::Request.new(env)
      # Admin routes require authentication
      if request.path.match(%r{^/admin})
        # Execute basic authentication
        super
      else
        # Pass basic authentication
        @app.call(env)
      end
    end
  end
end
