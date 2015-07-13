class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, :event, :time_slot
      t.timestamps null: false
    end
  end
end
