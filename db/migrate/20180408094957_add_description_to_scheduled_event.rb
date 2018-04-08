class AddDescriptionToScheduledEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_events, :description, :text
  end
end
