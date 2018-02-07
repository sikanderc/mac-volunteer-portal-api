class RemoveApprovedFromHourLogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :hour_logs, :approved, :boolean
  end
end
