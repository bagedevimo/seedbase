class Competitor < ApplicationRecord
  belongs_to :scheduled_event
  belongs_to :user
end
