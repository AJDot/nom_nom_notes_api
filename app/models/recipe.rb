# frozen_string_literal: true

# The recipe class, represents a recipe, of course
class Recipe < ApplicationRecord
  attribute :cook_time, :duration
  has_many :taggings, as: :taggable, primary_key: :client_id, dependent: :destroy
  accepts_nested_attributes_for :taggings, allow_destroy: true
  has_many :tags, through: :taggings, primary_key: :client_id
  has_many :steps, dependent: :destroy, primary_key: :client_id
  accepts_nested_attributes_for :steps, allow_destroy: true
  has_many :ingredients, dependent: :destroy, primary_key: :client_id
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  belongs_to :owner, class_name: 'User', primary_key: :client_id, inverse_of: :recipes, optional: true

  mount_uploader :image, RecipeImageUploader

  validates :name,
            uniqueness: { message: I18n.t('models.recipes.errors.name.uniqueness') },
            length: { minimum: 1, maximum: 100, message: I18n.t('models.recipes.errors.name.length') }

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :name,
      :description,
      :cook_time,
      :note,
      :image,
      :owner_id,
    ).to_params
  end
end
