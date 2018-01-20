class Event < ApplicationRecord
  audited

  scope :active, -> { where("deleted_at IS NULL") }

  validates_uniqueness_of :name, conditions: -> { active }
end
