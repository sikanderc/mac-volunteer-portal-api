class HourLogSerializer < ActiveModel::Serializer
  attributes :id, :date_worked, :hours_worked, :supervisor_name
  belongs_to :user
  belongs_to :event
end
