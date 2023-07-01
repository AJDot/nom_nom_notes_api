# frozen_string_literal: true

# The shopping list class, represents a shopping list, of course
class ShoppingList < ApplicationRecord
  attribute :items, default: -> { [] }

  belongs_to :owner, class_name: 'User', primary_key: :client_id, inverse_of: :shopping_lists, optional: true

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :owner_id,
      items: %i[
        id
        reference_id
        amount
        description
      ]
    ).to_params
  end
end
