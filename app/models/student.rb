class Student < ApplicationRecord
  belongs_to :teacher
  validates :name, presence: true
  validates :subject, presence: true
  validates :marks, numericality: { only_integer: true }
end
