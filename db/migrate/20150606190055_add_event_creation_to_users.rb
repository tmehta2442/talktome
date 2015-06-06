class AddEventCreationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :event_creation, :datetime
  end
end
