class CreateOrganisers < ActiveRecord::Migration[5.2]
  def change
    create_table :organisers, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :event_id
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
