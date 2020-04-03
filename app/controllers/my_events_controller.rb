class MyEventsController < ApplicationController
    before_action :authenticate_user!
    def index
        @myregistrations = current_user.registrations.all
        @myevents = current_user.events.all
    end
    def edit
        @myregistration = Registration.find(params[:id])
        if current_user != @myregistration.user
          sign_out current_user
          redirect_to root_path
          flash[:notice] = "Unauthorized Request"
        end
      end
    def update
        @myregistrations = Registration.find(params[:id])
        if params [:registered]
            @myregistrations.registered = true
            @myregistrations.save
            redirect_to rooth_path
        end
    end


    def myregistrations_params
        params.require(:registration).permit(:registered)
      end

end