class User < ApplicationRecord

  has_secure_password

  validates :password, presence: true
  validates_length_of :password, minimum: 6
  validates :password_confirmation, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :first_name, presence: true
  validates :last_name, presence: true

end
