class AddTeamToCompetitor < ActiveRecord::Migration[5.2]
  def change
    add_column :competitors, :team_id, :uuid, null: true
  end
end
