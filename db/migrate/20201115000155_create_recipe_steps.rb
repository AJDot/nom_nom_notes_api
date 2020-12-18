class CreateRecipeSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps, id: :uuid do |t|
      t.belongs_to :recipe, primary_key: :client_id, type: :uuid
      t.uuid :client_id
      t.text :description, null: false
      t.timestamps
    end
  end
end
