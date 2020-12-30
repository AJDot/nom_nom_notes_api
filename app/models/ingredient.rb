# frozen_string_literal: true

# Ingredients for a recipe
class Ingredient < ApplicationRecord
  belongs_to :recipe, primary_key: :client_id

  validates :description, presence: true

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :_destroy,
      :description,
      :recipe_id,
      :sort_order
    ).to_params
  end
end
