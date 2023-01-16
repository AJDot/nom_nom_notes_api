# frozen_string_literal: true

# A single Tag may belong to many Tagg
class Tag < ApplicationRecord
  include PgSearch::Model

  has_many :taggings, primary_key: :client_id, dependent: :destroy
  has_many :recipes, through: :taggings, primary_key: :client_id, source: :taggable, source_type: 'Recipe'

  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true },
                  }

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :name,
    ).to_params
  end
end
