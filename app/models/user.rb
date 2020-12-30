# frozen_string_literal: true

# A User of the site
class User < ApplicationRecord
  has_secure_password

  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: RegexUtil::EMAIL }
end
