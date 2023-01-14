class AddOwnerToDynamicRecipes < ActiveRecord::Migration[6.1]
  def change
    change_table :dynamic_recipes, bulk: true do |t|
      t.belongs_to :owner, type: :uuid, null: true
      t.foreign_key :users, column: :owner_id, primary_key: :client_id
    end
  end
end
