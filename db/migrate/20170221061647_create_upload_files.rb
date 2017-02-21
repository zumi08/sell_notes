class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string :name
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
