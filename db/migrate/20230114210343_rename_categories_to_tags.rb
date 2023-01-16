class RenameCategoriesToTags < ActiveRecord::Migration[6.1]
  def change
    rename_table(:categories, :tags)
    rename_table(:recipe_categories, :taggings)
    rename_column(:taggings, :category_id, :tag_id)
    rename_column(:taggings, :recipe_id, :taggable_id)
    add_column(:taggings, :taggable_type, :string)
    add_index(:taggings, %i[taggable_type taggable_id])
    reversible do |change|
      change.up do
        execute <<-SQL
          UPDATE taggings SET taggable_type = 'Recipe'
        SQL
      end
    end
  end
end
