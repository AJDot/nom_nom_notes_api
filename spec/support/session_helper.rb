# frozen_string_literal: true

# Help with sessions, sign in/out/up
module SessionHelper
  def sign_in(payload)
    post '/signin', params: payload
  end

  def session_headers
    {
      'ACCEPT' => 'application/json',
      'X-CSRF-TOKEN' => response.parsed_body['csrf']
    }
  end

  def json_content_type
    'application/json; charset=utf-8'
  end
end

RSpec.configure do |config|
  config.include SessionHelper
end
