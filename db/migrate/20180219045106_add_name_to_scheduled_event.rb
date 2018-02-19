class AddNameToScheduledEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_events, :name, :text

    ScheduledEvent.update_all name: "2018"
    
    change_column_null :scheduled_events, :name, null: false
  end
end
