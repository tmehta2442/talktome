class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, :event, :time_slot
      t.integer :hour
      t.timestamps null: false
    end
  end
end
