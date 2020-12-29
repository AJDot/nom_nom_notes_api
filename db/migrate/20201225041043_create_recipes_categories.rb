# typed: false
class CreateRecipesCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.uuid :client_id
      t.string :name
      t.timestamps
    end

    create_table :recipe_categories, id: :uuid do |t|
      t.uuid :client_id
      t.belongs_to :recipe, primary_key: :client_id, type: :uuid
      t.belongs_to :category, primary_key: :client_id, type: :uuid
      t.timestamps
    end
  end
end
