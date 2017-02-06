class CreateVolunteerSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteer_sessions do |t|
      t.belongs_to :user, null: false
      t.belongs_to :shelter, null: false
      t.string :time, null: false
      t.string :date, null: false
    end
  end
end
