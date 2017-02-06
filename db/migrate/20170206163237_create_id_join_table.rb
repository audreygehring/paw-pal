class CreateIdJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :join_shelters do |t|
      t.integer :shelter_id, null: false
      t.string :key_zip, null: false
    end
  end
end
