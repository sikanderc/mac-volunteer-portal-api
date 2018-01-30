class UserEventSerializer < ActiveModel::Serializer
  attributes :id, :admin
  belongs_to :event
  belongs_to :user
end
