# frozen_string_literal: true

# JSON Serializer for Ingredient class
class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :description, :recipe_id, :sort_order
end
