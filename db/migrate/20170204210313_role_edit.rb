class RoleEdit < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :role
    add_column :users, :admin, :boolean, default: false
  end
  def down
    add_column :users, :role, :string
    remove_column :users, :admin, :boolean, default: false
  end
end
