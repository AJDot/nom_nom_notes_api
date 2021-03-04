# frozen_string_literal: true

# Add password reset columns to user table
class AddPasswordResetColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
    end
  end
end
