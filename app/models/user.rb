require 'digest/md5'

class User < ApplicationRecord
  has_secure_password
  audited

  scope :active, -> { where("users.deleted_at IS NOT NULL") }

  has_many :organisers
  has_many :events, through: :organisers
end
