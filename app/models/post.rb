class Post < ApplicationRecord
  belongs_to :user
  belongs_to :event, optional: true
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true

end
