# frozen_string_literal: true

# Create users tables
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.uuid :client_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.index :email, unique: { case_sensitive_comparison: false }
      t.string :password_digest
      t.timestamps
    end
  end
end
