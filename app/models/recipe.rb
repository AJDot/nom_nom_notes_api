# typed: strict
class Recipe < ApplicationRecord
  attribute :cook_time, :duration
  has_many :recipe_categories, primary_key: :client_id
  accepts_nested_attributes_for :recipe_categories, allow_destroy: true
  has_many :categories, through: :recipe_categories, primary_key: :client_id
  has_many :steps, dependent: :destroy, primary_key: :client_id
  accepts_nested_attributes_for :steps, allow_destroy: true
  has_many :ingredients, dependent: :destroy, primary_key: :client_id
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  mount_uploader :image, RecipeImageUploader

  validates :name,
            uniqueness: {message: 'must be unique'},
            length: {minimum: 1, maximum: 100, message: 'must be between 1 and 100 characters'}
end
