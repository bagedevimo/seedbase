class CreateScheduledEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_events, id: :uuid do |t|
      t.uuid :event_id
      t.timestamp :starts_at, null: false
      t.timestamp :ends_at, null: false
      t.text :location_text, null: false
      t.text :lat, null: false
      t.text :long, null: false
      t.boolean :teams_enabled, null: false
      t.integer :maximum_team_size, null: false
      t.timestamp :signups_open_at
      t.timestamp :signups_close_at
      t.timestamps
    end
  end
end
