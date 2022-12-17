# frozen_string_literal: true

# The dynamic recipe class, represents a dynamic recipe, of course
class DynamicRecipe < ApplicationRecord
  validates :name,
            uniqueness: { message: I18n.t('models.dynamic_recipes.errors.name.uniqueness') },
            length: { minimum: 1, maximum: 100, message: I18n.t('models.dynamic_recipes.errors.name.length') }

  def self.to_params
    RecordParams.new(
      :id,
      :client_id,
      :name,
      blocks: [
        :id,
        :type,
        :parent_id,
        {
          content: [
            :text,
          ],
        },
      ],
    ).to_params
  end
end
