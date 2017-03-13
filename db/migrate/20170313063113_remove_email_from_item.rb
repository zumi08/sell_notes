class RemoveEmailFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :email, :string
    add_column :items, :year, :integer
  end
end
