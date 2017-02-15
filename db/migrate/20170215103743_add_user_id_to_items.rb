class AddUserIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :user_id, :integer
    add_column :items, :college_id, :integer
  end
end
