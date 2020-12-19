class Ingredient < ApplicationRecord
  belongs_to :recipe, primary_key: :client_id

  validates :description, presence: true
end
