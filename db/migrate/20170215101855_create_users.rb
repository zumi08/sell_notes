class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birthday
      t.string :adress
      t.string :univ
      t.string :college

      t.timestamps null: false
    end
  end
end
