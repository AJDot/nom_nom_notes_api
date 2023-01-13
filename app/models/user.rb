# frozen_string_literal: true

# A User of the site
class User < ApplicationRecord
  has_secure_password
  include Recoverable
  token_payload_keys :email

  has_many :recipes, inverse_of: :owner, primary_key: :client_id, foreign_key: :owner_id, dependent: :nullify

  validates :password, confirmation: true, unless: -> { password.blank? }
  validates :password_confirmation, presence: true, unless: -> { password.blank? }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: RegexUtil::EMAIL }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
