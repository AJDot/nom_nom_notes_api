class Category < ApplicationRecord
  has_many :recipe_categories, primary_key: :client_id
  has_many :recipes, through: :recipe_categories, primary_key: :client_id
end
