class Team < ApplicationRecord
  belongs_to :scheduled_event

  has_many :members, class_name: "Competitor"
end
