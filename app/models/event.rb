class Event < ApplicationRecord
  has_many :evaluations, dependent: :destroy
  has_many :event_presenters, dependent: :destroy
  has_many :presenters, through: :event_presenters, source: :user
end
