# frozen_string_literal: true

# Help with sessions, sign in/out/up
module SessionHelper
  def sign_in(payload)
    payload = payload.slice(:email, :password) if payload.is_a?(User)
    post '/auth/login', params: payload.to_json, headers: api_headers
  end

  def api_headers
    {
      'Content-Type': content_type_map[:json] 
    }
  end

  def session_headers
    {
      'ACCEPT' => 'application/json',
      'X-CSRF-TOKEN' => response.parsed_body['csrf'],
    }
  end

  def content_type_map
    {
      json: 'application/json; charset=utf-8',
    }
  end
end

RSpec.configure do |config|
  config.include Rodauth::Rails::Test::Controller, type: :controller
  config.include SessionHelper
end
