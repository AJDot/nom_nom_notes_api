# frozen_string_literal: true

# Encode/decode payload with JWE
class Tokenizer
  SECRET_TOKEN = Rails.application.credentials.secret_tokenizer_base

  def self.encrypt(payload)
    payload = payload.to_json unless payload.is_a? String
    JWE.encrypt(payload, SECRET_TOKEN, alg: 'dir')
  end

  def self.decrypt(token)
    payload = JWE.decrypt(token, SECRET_TOKEN)
    parse(payload)
  end

  def self.parse(json)
    JSON.parse(json)
  rescue JSON::ParserError
    json
  end

  private_class_method :parse
end
