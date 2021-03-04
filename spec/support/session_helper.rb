# frozen_string_literal: true

# Help with sessions, sign in/out/up
module SessionHelper
  def sign_in(payload)
    payload = payload.slice(:email, :password) if payload.is_a?(User)
    post '/signin', params: payload
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
  config.include SessionHelper
end
