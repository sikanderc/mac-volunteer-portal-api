class AddApprovedToHourLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :hour_logs, :approved, :boolean, :default => false
  end
end
