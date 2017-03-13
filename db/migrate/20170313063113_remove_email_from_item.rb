class RemoveEmailFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :email, :string
    add_column :items, :year, :integer
    add_column :items, :hand_over_way, :integer
  end
end
