class RemoveOwnerColumn < ActiveRecord::Migration[5.0]
  def up
    remove_column :shelters, :owner_id
    remove_column :shelters, :key
  end
  def down
    add_column :shelters, :owner_id, :integer
    add_column :shelters, :key, :string
  end

end
