class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  belongs_to :user
  belongs_to :event, optional: true
  has_many :comments
end
