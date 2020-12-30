# frozen_string_literal: true

# JSON Serializer for RecipeCategory class
class RecipeCategorySerializer < ActiveModel::Serializer
  attributes :id, :client_id, :recipe_id, :category_id
end
