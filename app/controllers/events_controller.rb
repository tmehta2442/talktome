class EventsController < ApplicationController
  before_action :admin_user_edit, only: [:edit, :destroy]
  before_action :admin_user_create, only: :create
  
  def index
    @event = Event.new
    @events = Event.all
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end
  
  def new
    
  end

  def show
    if logged_in?
      @event = Event.find(params[:id])
    else
    store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  def edit
    @events = Event.all
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
    params.require(:event).permit(:event_name, :start_time)
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
