class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :location1
      t.string :location2
      t.string :city
      t.string :state
      t.string :zip
      t.text :details
      t.boolean :approved

      t.timestamps
    end
  end
end
