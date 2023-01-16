# frozen_string_literal: true

# JSON Serializer for Tagging class
class TaggingSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :tag_id, :taggable_id, :taggable_type
end
