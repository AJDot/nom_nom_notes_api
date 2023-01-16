# frozen_string_literal: true

# JSON Serializer for Recipe class
class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :name, :description, :cook_time, :note, :image, :owner_id
  has_many :steps, serializer: StepSerializer
  has_many :ingredients, serializer: IngredientSerializer
  has_many :tags, serializer: TagSerializer
  has_many :taggings, serializer: TaggingSerializer
end
