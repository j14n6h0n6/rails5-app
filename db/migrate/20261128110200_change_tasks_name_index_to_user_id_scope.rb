class ChangeTasksNameIndexToUserIdScope < ActiveRecord::Migration[5.2]
  def change
    remove_index :tasks, :name
    add_index :tasks, [:user_id, :name], unique: true
  end
end
