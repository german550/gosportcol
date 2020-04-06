class MyEventsController < ApplicationController
    before_action :authenticate_user!
    def index
        @myregistrations = current_user.registrations
        @myevents = current_user.events
    end
    
    def myregistrations_params
        params.require(:registration).permit(:registered)
      end
