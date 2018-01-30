class CreateHourLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :hour_logs do |t|
      t.date :date_worked
      t.float :hours_worked
      t.string :supervisor_name
      t.text :interest_field
      t.text :improvement_field
      t.text :info_field
      t.integer :event_id
      t.integer :user_id
      t.boolean :approved

      t.timestamps
    end
  end
end
