class CreateTeamInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :team_invites, id: :uuid do |t|
      t.string :team_id, null: false
      t.string :user_id, null: false
      t.string :invited_email, null: false
      t.timestamps
    end
  end
end
