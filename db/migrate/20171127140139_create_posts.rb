class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :event_id
      t.integer :user_id
      t.boolean :approved

      t.timestamps
    end
  end
end
