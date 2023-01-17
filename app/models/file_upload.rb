# frozen_string_literal: true

# Base class for file uploads
class FileUpload < ApplicationRecord
  belongs_to :attachable, primary_key: :client_id, polymorphic: true, optional: true

  mount_uploader :file, FileUploader

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :_destroy,
      :file,
      :attachable_type,
      :attachable_id,
    ).to_params
  end
end
