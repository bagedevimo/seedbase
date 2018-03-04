class FixupTeamsScheduledEventRelationship < ActiveRecord::Migration[5.2]
  def change
    Team.destroy_all
    remove_column :teams, :scheduled_event_id
    add_column :teams, :scheduled_event_id, :uuid, null: false
  end
end
