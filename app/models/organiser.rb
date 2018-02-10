class Organiser < ApplicationRecord
  audited
  
  belongs_to :event
  belongs_to :user

  scope :active, -> { where("organisers.deleted_at IS NOT NULL") }
end
