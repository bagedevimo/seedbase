class CreateCompetitors < ActiveRecord::Migration[5.2]
  def change
    create_table :competitors, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :scheduled_event_id, null: false
      t.timestamps
    end
  end
end
