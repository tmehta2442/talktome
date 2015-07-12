class Appointment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :time_slot
end
