class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :feedbacks, foreign_key: "student_id"
  has_many :evaluations, foreign_key: "student_id"
  has_many :event_presenters, foreign_key: :user_id, dependent: :destroy
  has_many :presented_events, through: :event_presenters, source: :event  
end
  