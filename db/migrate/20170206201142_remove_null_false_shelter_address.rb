class RemoveNullFalseShelterAddress < ActiveRecord::Migration[5.0]
  def change
    change_column :shelters, :address, :string, null: true
  end
end
