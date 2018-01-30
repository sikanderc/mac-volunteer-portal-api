class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :posts
  has_many :comments
  has_many :hour_logs
  has_many :user_events
  has_many :events, through: :user_events

end
