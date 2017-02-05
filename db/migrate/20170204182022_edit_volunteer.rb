class EditVolunteer < ActiveRecord::Migration[5.0]
  def up
    remove_column :sessions, :volunteer_id
  end
  def down
    add_column :sessions, :volunteer_id, :integer
  end
end
