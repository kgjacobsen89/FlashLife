class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @upload = Upload.new
  end

  def new
    @event = Event.new
    @user = User.find(session[:user_id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to user_path(current_user.id)
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
      redirect_to user_path(current_user.id)
    else
    flash[:notice] = "Unprocessable Entity"
    render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to user_path(current_user.id)
  end

  private

    def event_params
      params.require(:event).permit(:name, :date, :is_public, :location, :package_type, :user_id)
    end
end
