class StepSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :description, :recipe_id
end
