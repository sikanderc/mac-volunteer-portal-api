class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :start_time, :end_time, :location1, :details
  has_many :posts
  has_many :hour_logs
  has_many :user_events
  has_many :users, through: :user_events

end
