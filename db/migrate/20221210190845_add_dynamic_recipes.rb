class AddDynamicRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :dynamic_recipes, id: :uuid do |t|
      t.uuid :client_id
      t.string :name, limit: 100, null: false
      t.index :name, unique: true
      t.jsonb :blocks
      t.timestamps
    end
  end
end
