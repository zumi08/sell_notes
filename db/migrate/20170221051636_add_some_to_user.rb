class AddSomeToUser < ActiveRecord::Migration
  def change
    add_column :users, :college_id, :integer
    remove_column :users, :univ, :string
    remove_column :users, :college, :string
  end
end
