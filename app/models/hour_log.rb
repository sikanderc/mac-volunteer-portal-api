class HourLog < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :date_worked, presence: true
  validates :hours_worked, presence: true
  validates :supervisor_name, presence: true
end
