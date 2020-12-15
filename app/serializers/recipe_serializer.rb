class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :name, :description, :cook_time, :note
  has_many :steps, serializer: StepSerializer
end
