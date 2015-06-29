class TimeSlot < ActiveRecord::Base
  has_many :appointments
  
  def name
    "#{hour}:00"
  end
end
