# frozen_string_literal: true

# JSON Serializer for Step class
class StepSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :description, :recipe_id, :sort_order
end
