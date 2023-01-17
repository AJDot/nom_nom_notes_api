class AddFileUploads < ActiveRecord::Migration[6.1]
  def change
    create_table :file_uploads, id: :uuid do |t|
      t.uuid :client_id
      t.string :file
      t.timestamps
      t.belongs_to :attachable, primary_key: :client_id, type: :uuid, polymorphic: true
    end
  end
end
