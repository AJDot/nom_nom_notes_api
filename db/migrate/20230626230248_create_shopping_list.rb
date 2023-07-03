class CreateShoppingList < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_lists, id: :uuid do |t|
      t.uuid :client_id
      t.jsonb :items, default: []
      t.belongs_to :owner, type: :uuid, null: true
      t.foreign_key :users, column: :owner_id, primary_key: :client_id
      t.timestamps
    end
  end
end
