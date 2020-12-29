# typed: true
class AddRecipeImage < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :image, :string
  end
end
