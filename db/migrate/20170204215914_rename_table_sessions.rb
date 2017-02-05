class RenameTableSessions < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :sessions, :volunteer_sessions
  end
  def self.down
    rename_table :volunteer_sessions, :sessions
  end
end
