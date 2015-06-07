class EventsController < ApplicationController
  before_action :admin_user, only: [:index, :new, :edit]
  
  def index
    @event = Event.new
  end
  
  def new
    
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def edit
  end
  
  private
  
  def admin_user
    if !current_user.admin?
      redirect_to(root_url) && flash[:info] = "Not an admin, cannot create events"
    elsif current_user.admin?
      flash[:info] = "create your event here"
    end
  end
end
