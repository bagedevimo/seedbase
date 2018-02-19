class Team < ApplicationRecord
  belongs_to :scheduled_event

  has_many :competitors, as: :team_members
end
