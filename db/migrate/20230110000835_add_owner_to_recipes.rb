class AddOwnerToRecipes < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.index :client_id, unique: true
    end

    change_table :recipes, bulk: true do |t|
      t.belongs_to :owner, type: :uuid, null: true
      t.foreign_key :users, column: :owner_id, primary_key: :client_id
    end
  end
end
