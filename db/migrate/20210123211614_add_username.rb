# frozen_string_literal: true

# Add username column to users table
class AddUsername < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
  end
end
