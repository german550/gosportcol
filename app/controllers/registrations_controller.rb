class RegistrationsController < ApplicationController
  def index
    @registrations = Registrations.all
  end
  def new
    @registration = Registration.new
    @event = Event.find(params[:event_id])
  end

  def create
    @registration = Registration.new(registration_params)
    @event = Event.find(params[:event_id])
    @registration.user_id = current_user.id
    @registration.event_id = params[:event_id]
    if @registration.save!
      redirect_to root_path
     flash[:notice] = "Your Registration is Completed"
    else
     redirect_back fallback_location: root_path
     flash[:alert] = "Registration Failed"
    end
  end
  def show
    @registration = Registration.find(params[:id])
  end

  private
  def registration_params
    params.require(:registration).permit(:registered)
  end

end
