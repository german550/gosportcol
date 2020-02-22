class EventsController < ApplicationController
before_action :authenticate_user!
def index
  @events = Event.all
end
def new
  @event = Event.new
end

def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
      if @event.save
        redirect_to @event
      flash[:notice] = "Event Created!"
      else
       redirect_back (fallback location: root_path)
       flash[:alert] = "Event Creation failed"
      end
end
def show
  @event = Event.find(params[:id])
end
def destroy
      event = Event.find(params[:id])
    if current_user == event.user
      event.destroy
      redirect_to "/events"
      flash[:notice] = "Event Deleted"
    else
      redirect_back (fallback location: root_path)
      flash[:alert] = "Not authorized to delete Event"
    end
  end
  def edit
    @event = Event.find(params[:id])
    if current_user != @event.user
      sign_out current_user
      redirect_to root_path
      flash[:notice] = "Unauthorized Request"
    end
  end
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if current_user == @event.user
        @event.update(event_params)
        redirect_to "/events/#{@event.id}/edit"
        flash[:notice] = "Event Succesfully Updated"
      else
        redirect_back(fallback_location: root_path)
        flash[:alert] = "Not authorized to edit this event"
      end
  end

  private
  def event_params
    params.require(:event).permit(:place,:pic,:address,:date, :time, :price, :description)
  end


end
