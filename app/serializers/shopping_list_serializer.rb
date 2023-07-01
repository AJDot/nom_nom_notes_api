# frozen_string_literal: true

# JSON Serializer for ShoppingList class
class ShoppingListSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :owner_id, :items
end
