class Event < ApplicationRecord
  has_many :posts
  has_many :hour_logs
  has_many :user_events
  has_many :users, through: :user_events

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location1, presence: true
  validates :details, presence: true

end
