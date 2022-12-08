# frozen_string_literal: true

# Recipe category class
# A single Category may belong to many Recipes
class Category < ApplicationRecord
  include PgSearch::Model

  has_many :recipe_categories, primary_key: :client_id, dependent: :destroy
  has_many :recipes, through: :recipe_categories, primary_key: :client_id

  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true },
                  }

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :name,
    ).to_params
  end
end
