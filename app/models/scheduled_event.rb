class ScheduledEvent < ApplicationRecord
  audited

  belongs_to :event

  has_many :competitors

  scope :next_first, -> { order("starts_at DESC") }

  def identifier
    starts_at.strftime("on %Y/%m/%d at %H:%M")
  end

  def duration
    ends_at - starts_at
  end
end
