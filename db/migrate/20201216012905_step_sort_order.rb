class StepSortOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :steps, :sort_order, :integer
  end
end
