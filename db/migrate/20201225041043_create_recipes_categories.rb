# frozen_string_literal: true

# Adds categories table and recipe_categories table to relate categories to recipes
class CreateRecipesCategories < ActiveRecord::Migration[6.0]
  def change
    add_categories
    add_recipe_categories
  end

  def add_categories
    create_table :categories, id: :uuid do |t|
      t.uuid :client_id
      t.string :name
      t.timestamps
    end
  end

  def add_recipe_categories
    create_table :recipe_categories, id: :uuid do |t|
      t.uuid :client_id
      t.belongs_to :recipe, primary_key: :client_id, type: :uuid
      t.belongs_to :category, primary_key: :client_id, type: :uuid
      t.timestamps
    end
  end
end
