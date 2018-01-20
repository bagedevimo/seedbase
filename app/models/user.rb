require 'digest/md5'

class User < ApplicationRecord
  has_secure_password
  audited
end
