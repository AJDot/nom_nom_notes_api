# frozen_string_literal: true

# The dynamic recipe class, represents a dynamic recipe, of course
class DynamicRecipe < ApplicationRecord
  attribute :blocks, default: -> { [] }

  has_many :attachments, as: :attachable, class_name: 'FileUpload', primary_key: :client_id, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true
  belongs_to :owner, class_name: 'User', primary_key: :client_id, inverse_of: :recipes, optional: true
  has_many :taggings, as: :taggable, primary_key: :client_id, dependent: :destroy
  accepts_nested_attributes_for :taggings, allow_destroy: true
  has_many :tags, through: :taggings, primary_key: :client_id

  validates :name,
            uniqueness: { message: I18n.t('models.dynamic_recipes.errors.name.uniqueness') },
            length: { minimum: 1, maximum: 100, message: I18n.t('models.dynamic_recipes.errors.name.length') }

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :name,
      :owner_id,
      blocks: [
        :id,
        :type,
        :parent_id,
        {
          content: %i[
            text
            block_id
            attachment_id
          ],
        },
      ],
    ).to_params
  end
end
