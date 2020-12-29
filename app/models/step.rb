# typed: strict
class Step < ApplicationRecord
  belongs_to :recipe, primary_key: :client_id

  validates :description, presence: true
end
