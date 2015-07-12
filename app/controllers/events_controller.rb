class EventsController < ApplicationController
  before_action :admin_user_edit, only: [:edit, :destroy, :new]
  before_action :admin_user_create, only: :create
  
  def index
    @events = Event.all
  end
  
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to @event
    else
      redirect_to events_url
      flash[:danger] = "Invalid Event"
    end
  end
  
  def new
    @event = Event.new
  end

  def show
    
    if logged_in?
      @event = Event.find(params[:id])
      @appointment = Appointment.where(event_id: @event)
    else
    store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  def edit
    @events = Event.all
    @users = User.all
    if !logged_in?
      store_location
      flash[:info] = "only admin can edit, please log in as admin"
      redirect_to login_url
    elsif !current_user.admin?
      redirect_to(root_url) && flash[:info] = "Not an admin, cannot edit events"
    
    end
  end
  
  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_edit_path
  end
  private
  
  def event_params
    params.require(:event).permit(:event_name, :start_time, time_slot_ids: [])
  end
  
  def admin_user_edit
    if !logged_in?
      flash[:info] = "please log in"
    elsif !current_user.admin?
      redirect_to(root_url) && flash[:info] = "Not an admin, cannot edit events"
    end
  end
  
  def admin_user_create
    if !logged_in?
      flash[:info] = "please log in"
    elsif !current_user.admin?
      redirect_to(root_url) && flash[:info] = "Not an admin, cannot create events"
    end
  end  
end