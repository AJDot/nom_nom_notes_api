# frozen_string_literal: true

# JSON Serializer for User class
class FileUploadSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :file, :attachable_type, :attachable_id
end
