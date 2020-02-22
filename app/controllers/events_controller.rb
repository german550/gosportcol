class EventsController < ApplicationController
def index
  @events = Event.all
end
def new
    @events = Event.new
end

def create
    @events = Event.new(events_params)
    @events.user_id = current_user.id
      if @events.save
        redirect_to @events
      flash[:notice] = "Event Created!"
      else
       redirect_back (fallback location: root_path)
       flash[:alert] = "Event Creation failed"
      end
end

private
def events_params
  params.require(:events).permit(:place, :pic, :address, :date, :time, :price, :description)
end


end
