# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'rack/cors'
use Rack::Cors do
  # allow all origins in development
  allow do
    origins Rails.env.test? ? 'localhost:8081' : 'localhost:8080'
    resource '*',
             headers: :any,
             credentials: true,
             methods: %i[get post put patch delete options head]
  end
end
