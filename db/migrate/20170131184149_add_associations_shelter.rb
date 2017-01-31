class AddAssociationsShelter < ActiveRecord::Migration[5.0]
  def change
    add_column :shelters, :owner_id, :integer
  end
end
