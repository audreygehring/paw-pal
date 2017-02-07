class AddColumnsToShelters < ActiveRecord::Migration[5.0]
  def change
    add_column :shelters, :description, :string
    add_column :shelters, :website, :string
  end
end
