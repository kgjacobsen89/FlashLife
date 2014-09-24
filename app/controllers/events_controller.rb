class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    
    if @event.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    else
      render 'edit' 
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy 
    redirect_to user_path(@user)
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :is_public, :location, :package_type, :user_id)
  end
end
