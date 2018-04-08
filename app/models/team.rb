class Team < ApplicationRecord
  belongs_to :scheduled_event

  has_many :members, class_name: "Competitor"
  has_many :users, through: :members

  has_many :team_invites
end
