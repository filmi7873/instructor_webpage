class Evaluation < ApplicationRecord
  belongs_to :event
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  validates :clarity, :organization, :technical, inclusion: { in: 1..5 }
  validates :comments, presence: true
end
