class EventsController < ApplicationController
  
  respond_to :json

  def index
    @events = Event.all
    respond_with @events, each_serializer: EventSerializer 
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @user = User.find(session[:user_id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      flash[:notice] = "Unprocessable Entity"
      render "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to events_path
    else
    flash[:notice] = "Unprocessable Entity"
    render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
    end
  end

  private

    def event_params
      params.require(:event).permit(:name, :date)
    end
end
