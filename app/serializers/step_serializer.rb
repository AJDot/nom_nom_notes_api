# typed: strict
class StepSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :description, :recipe_id, :sort_order
end
