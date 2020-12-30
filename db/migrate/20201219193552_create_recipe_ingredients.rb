# frozen_string_literal: true

# Adds categories table and recipe_ingredients table to relate ingredients to recipes
class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients, id: :uuid do |t|
      t.belongs_to :recipe, primary_key: :client_id, type: :uuid
      t.uuid :client_id
      t.text :description, null: false
      t.integer :sort_order
      t.timestamps
    end
  end
end
