class MyEventsController < ApplicationController
    before_action :authenticate_user!
    def index
        @myregistrations = current_user.registrations.all
        @myevents = current_user.events.all

    end
    def edit
      @registration = Registration.find(params[:id])
      if current_user != @registration.user
        sign_out current_user
        redirect_to root_path
        flash[:notice] = "Unauthorized Request"
      end
    end
    def update
      @registration = Registration.find(params[:id])
      @registration.update(registration_params)
      if current_user == @registration.user
          @registration.update(registration_params)
          redirect_to "/events/#{@registration.id}/edit"
          flash[:notice] = "Event Succesfully Updated"
        else
          redirect_back(fallback_location: root_path)
          flash[:alert] = "Not authorized to edit this registration"
        end
      end

    def registrations_params
        params.require(:registration).permit(:registered)
      end

end