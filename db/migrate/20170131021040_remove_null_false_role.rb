class RemoveNullFalseRole < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :role, :string
  end

  def down
    change_column :users, :role, :string, null: :false
  end
end
