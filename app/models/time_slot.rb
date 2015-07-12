class TimeSlot < ActiveRecord::Base
  has_many :appointments
  
  def name
    if hour < 12
      "#{hour}:00am"
    elsif hour == 12
      "#{hour}:00pm"
    else
      "#{hour - 12}:00pm"
    end
  end
end
