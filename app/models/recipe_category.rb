# frozen_string_literal: true

# Join table between recipes and categories
class RecipeCategory < ApplicationRecord
  belongs_to :recipe, primary_key: :client_id
  belongs_to :category, primary_key: :client_id

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :_destroy,
      :recipe_id,
      :category_id,
    ).to_params
  end
end
