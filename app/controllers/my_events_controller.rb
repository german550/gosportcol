class MyEventsController < ApplicationController
    before_action :authenticate_user!
    def index
        @myregistrations = current_user.registrations.all
        @myevents = current_user.events.all
    end
      
end