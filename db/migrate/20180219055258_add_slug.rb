class AddSlug < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.transaction do
      add_column :events, :slug, :text
      add_column :scheduled_events, :slug, :text

      Event.all.each do |event|
        event.slug = event.name.parameterize
        event.save!
      end

      ScheduledEvent.all.each do |scheduled_event|
        scheduled_event.slug = scheduled_event.name.parameterize
        scheduled_event.save!
      end

      change_column_null :events, :slug, false
      change_column_null :scheduled_events, :slug, false
    end
  end
end
