class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :detail
      t.string :email
      t.integer :price

      t.timestamps null: false
    end
  end
end
