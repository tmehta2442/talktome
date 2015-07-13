class Event < ActiveRecord::Base
  belongs_to :user
  has_many :appointments
  has_many :time_slots, through: :appointments
  has_many :bookings
  validates :event_name, presence: true, length: { maximum: 50 }
  validates :start_time, presence: true
end