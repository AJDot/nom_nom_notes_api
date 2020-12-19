class Recipe < ApplicationRecord
  attribute :cook_time, :duration
  # has_and_belongs_to_many :categories, join_table: 'recipes_categories'
  # has_and_belongs_to_many :ethnicities, join_table: 'recipes_ethnicities'
  has_many :steps, dependent: :destroy, primary_key: :client_id
  accepts_nested_attributes_for :steps, allow_destroy: true
  has_many :ingredients, dependent: :destroy, primary_key: :client_id
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  # mount_uploader :image, RecipeImageUploader

  validates :name,
            uniqueness: {message: 'must be unique'},
            length: {minimum: 1, maximum: 100, message: 'must be between 1 and 100 characters'}
end
