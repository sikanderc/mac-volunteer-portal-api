class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :organization
      t.string :address
      t.string :apt
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :phone
      t.date :dob
      t.string :gender
      t.string :password_digest
      t.boolean :miner
      t.boolean :volunteer
      t.boolean :super_admin

      t.timestamps
    end
  end
end
