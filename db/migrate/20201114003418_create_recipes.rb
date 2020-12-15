class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes, id: :uuid do |t|
      t.uuid :client_id
      t.string :name, limit: 100, null: false
      t.text :description
      t.interval :cook_time
      t.text :note
      t.timestamps
    end
  end
end
