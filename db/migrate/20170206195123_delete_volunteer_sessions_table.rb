class DeleteVolunteerSessionsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :volunteer_sessions
  end

  def down
    create_table :volunteer_sessions
  end
end
