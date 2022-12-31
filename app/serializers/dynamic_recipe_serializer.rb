# frozen_string_literal: true

# JSON Serializer for DynamicRecipe class
class DynamicRecipeSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :name, :blocks
  has_many :attachments, serializer: FileUploadSerializer
end
