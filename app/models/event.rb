class Event < ActiveRecord::Base
  has_and_belongs_to_many :user, dependent: :destroy
  validates :event_name, presence: true, length: { maximum: 50 }
  validates :start_time, presence: true
end
