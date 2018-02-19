class Event < ApplicationRecord
  audited

  validates_uniqueness_of :name, conditions: -> { active }

  scope :active, -> { where("events.deleted_at IS NULL") }

  has_many :organisers
  has_many :users, through: :organisers
  has_many :scheduled_events

  has_one_attached :banner
  has_one_attached :avatar

  def find_named(name)
    Event.where("LOWER(name) = #{name}").first
  end

  def to_param
    name.parameterize
  end
end
