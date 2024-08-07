class Teacher < ApplicationRecord
  has_secure_password
  has_many :students
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
