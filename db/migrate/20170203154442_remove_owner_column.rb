class RemoveOwnerColumn < ActiveRecord::Migration[5.0]
  def up
    remove_column :shelters, :owner_id
  end
  def down
    add_column :shelters, :owner_id, :integer
  end

end
