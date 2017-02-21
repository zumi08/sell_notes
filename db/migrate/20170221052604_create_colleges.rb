class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.integer :university_id

      t.timestamps null: false
    end
  end
end
