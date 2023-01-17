# frozen_string_literal: true

# Join table between tags anything else
class Tagging < ApplicationRecord
  belongs_to :tag, primary_key: :client_id
  belongs_to :taggable, primary_key: :client_id, polymorphic: true

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :_destroy,
      :tag_id,
      :taggable_id,
      :taggable_type,
    ).to_params
  end
end
