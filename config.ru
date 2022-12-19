# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

require 'rack/cors'
use Rack::Cors do
  allowed_origins = ENV.fetch('SPA_ORIGIN', nil)
  allowed_origins ||= if Rails.env.test?
                        'localhost:5174'
                      elsif Rails.env.staging?
                        ['127.0.0.1:4173']
                      elsif Rails.env.development?
                        ['localhost:5173', %r{\Ahttp://192.168.1.\d{1,3}(:\d+)?\z}]
                      end
  allow do
    origins allowed_origins
    resource '*',
             headers: :any,
             credentials: true,
             methods: %i[get post put patch delete options head]
  end
end
