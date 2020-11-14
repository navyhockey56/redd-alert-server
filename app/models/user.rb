class User < ApplicationRecord
  # Encrypts the password
  #has_secure_password

  validates_presence_of :username, :password
end
