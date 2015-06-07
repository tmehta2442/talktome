class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :start_time
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
