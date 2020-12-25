class RecipeCategory < ApplicationRecord
  belongs_to :recipe, primary_key: :client_id
  belongs_to :category, primary_key: :client_id
end
