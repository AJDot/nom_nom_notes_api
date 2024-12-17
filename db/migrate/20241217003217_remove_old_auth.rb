class RemoveOldAuth < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.remove :reset_password_token, type: :string
      t.remove :reset_password_sent_at, type: :datetime
      t.remove :password_digest, type: :string
    end
  end
end
