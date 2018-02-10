class RemoveTeamsEnabledFromScheduledEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :scheduled_events, :teams_enabled, :boolean
  end
end
