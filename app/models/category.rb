class Category < ApplicationRecord
  include PgSearch::Model

  has_many :recipe_categories, primary_key: :client_id
  has_many :recipes, through: :recipe_categories, primary_key: :client_id

  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }
end
