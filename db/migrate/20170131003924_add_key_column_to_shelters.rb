class AddKeyColumnToShelters < ActiveRecord::Migration[5.0]
  def change
    add_column :shelters, :key, :string, null: :false, unique: :true
  end
end
