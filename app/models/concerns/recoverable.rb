# frozen_string_literal: true

# Concern about being able to reset a password
module Recoverable
  extend ActiveSupport::Concern

  class_methods do
    def token_payload_keys(*payload_keys)
      define_method(:token_payload) do
        slice(*payload_keys)
      end
    end
  end

  included do
    attribute :reset_password_token, type: String
    attribute :reset_password_sent_at, type: Time

    # default is no keys
    def token_payload_keys
      []
    end
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password, password_confirmation)
    self.reset_password_token = nil
    self.password = password
    self.password_confirmation = password_confirmation
    save
  end

  private

  def generate_token
    Tokenizer.encrypt(token_payload)
  end
end
