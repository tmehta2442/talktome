class BookingsController < ApplicationController
   def new
    @time_slot = TimeSlot.find(params[:time_slot_id])
    @event = Event.find(params[:event_id])
    @booking = current_user.bookings.build(time_slot: @time_slot, event: @event)
  end
  
  def create
    @booking = current_user.bookings.build(booking_params)
    @booking.save
    redirect_to event_path(@booking.event)
  end
  
  private
    def booking_params
      params.require(:booking).permit(:time_slot_id, :event_id)
    end
end
