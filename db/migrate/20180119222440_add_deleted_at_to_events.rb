class AddDeletedAtToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :deleted_at, :timestamp
  end
end
