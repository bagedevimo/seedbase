class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams, id: :uuid do |t|
      t.belongs_to :scheduled_event
      t.text :name, null: false
      t.timestamps
    end
  end
end
