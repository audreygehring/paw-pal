class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.integer :shelter_id, null: false
      t.integer :volunteer_id, null: false
      t.string :time, null: false
    end
  end
end
