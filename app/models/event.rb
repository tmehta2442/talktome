class Event < ActiveRecord::Base
  validates :event_name, presence: true, length: { maximum: 50 }
  validates :start_time, presence: true
end
