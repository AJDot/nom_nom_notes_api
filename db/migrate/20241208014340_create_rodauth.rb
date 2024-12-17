class CreateRodauth < ActiveRecord::Migration[6.1]
  def change
    enable_extension "citext"

    change_table :users, bulk: true do |t|
      t.integer :status, null: false, default: 1
      t.string :password_hash
      t.remove_index(:email, unique: { case_sensitive_comparison: false })
      t.index :email, unique: true, where: "status IN (1, 2)"
    end

    reversible do |direction|
      change_table :users, bulk: true do |t|
        direction.up {t.change(:email, :citext, null: false)}
        direction.down {t.change(:email, :string)}
      end
    end

    # Used by the password reset feature
    create_table :user_password_reset_keys, id: false do |t|
      t.uuid :id, primary_key: true
      t.foreign_key :users, column: :id
      t.string :key, null: false
      t.datetime :deadline, null: false
      t.datetime :email_last_sent, null: false, default: -> { "CURRENT_TIMESTAMP" }
    end

    # Used by the account verification feature
    create_table :user_verification_keys, id: false do |t|
      t.uuid :id, primary_key: true
      t.foreign_key :users, column: :id
      t.string :key, null: false
      t.datetime :requested_at, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.datetime :email_last_sent, null: false, default: -> { "CURRENT_TIMESTAMP" }
    end

    # Used by the verify login change feature
    create_table :user_login_change_keys, id: false do |t|
      t.uuid :id, primary_key: true
      t.foreign_key :users, column: :id
      t.string :key, null: false
      t.string :login, null: false
      t.datetime :deadline, null: false
    end
  end
end
