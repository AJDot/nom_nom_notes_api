# frozen_string_literal: true

# JSON Serializer for DynamicRecipe class
class DynamicRecipeSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :name, :blocks, :owner_id
  has_many :attachments, serializer: FileUploadSerializer
  has_many :tags, serializer: TagSerializer
  has_many :taggings, serializer: TaggingSerializer
end
