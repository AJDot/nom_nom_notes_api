# frozen_string_literal: true

# A User of the site
class User < ApplicationRecord
  include Rodauth::Rails.model
  enum status: { unverified: 1, verified: 2, closed: 3 }

  has_many :recipes, inverse_of: :owner, primary_key: :client_id, foreign_key: :owner_id, dependent: :nullify
  has_many :dynamic_recipes, inverse_of: :owner, primary_key: :client_id, foreign_key: :owner_id, dependent: :nullify
  has_many :shopping_lists, inverse_of: :owner, primary_key: :client_id, foreign_key: :owner_id, dependent: :destroy

  validates :password, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: RegexUtil::EMAIL }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
