# frozen_string_literal: true

# Add username column to users table
class AddUsername < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :username
      t.index :username, unique: { case_sensitive_comparison: false }
    end
  end
end
