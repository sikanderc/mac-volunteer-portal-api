class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :hour_logs
  has_many :user_events
  has_many :events, through: :user_events

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "bad format"}
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }


end
