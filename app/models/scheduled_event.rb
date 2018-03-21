class ScheduledEvent < ApplicationRecord
  audited

  belongs_to :event

  has_many :competitors
  has_many :teams

  scope :next_first, -> { order("starts_at DESC") }

  def identifier
    starts_at.strftime("on %Y/%m/%d at %H:%M")
  end

  def duration
    ends_at - starts_at
  end

  def to_param
    slug
  end
end
