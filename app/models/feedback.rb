class Feedback < ApplicationRecord
  belongs_to :event
  belongs_to :student, class_name: "User"
end
