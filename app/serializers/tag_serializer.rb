# frozen_string_literal: true

# JSON Serializer for Tag class
class TagSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :name
  has_many :recipes, serializer: RecipeSerializer
  has_many :taggings, serializer: TaggingSerializer
end
