class UserShelterAssociation < ActiveRecord::Migration[5.0]
  def change
    add_reference :shelters, :user, index: true, null: true
    add_reference :users, :shelter, index: true, null: true
  end
end
