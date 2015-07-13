class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :time_slot
end
