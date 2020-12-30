# frozen_string_literal: true

# JSON Serializer for Category class
class CategorySerializer < ActiveModel::Serializer
  attributes :id, :client_id, :name
  has_many :recipes, serializer: RecipeSerializer
  has_many :recipe_categories, serializer: RecipeCategorySerializer
end
