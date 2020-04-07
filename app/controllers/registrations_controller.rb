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
    @registration.event_id = @event.id
    if @registration.save!
      redirect_to root_path
     flash[:notice] = "Your Registration is Completed"
    else
     redirect_back fallback_location: root_path
     flash[:alert] = "Registration Failed"
    end
  end
  def edit
    @event = Event.find(params[:event_id])
    @registration = Registration.find(params[:id])
    if current_user != @registration.user
      sign_out current_user
      redirect_to root_path
      flash[:notice] = "Unauthorized Request"
    end
  end
  def update
    @event = Event.find(params[:event_id])
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
  def unregister
    @registration = Registration.find(params[:registration_id])
    @registration.destroy
    redirect_to "/my_events/"
    flash[:notice] = "Event Succesfully Updated"
<<<<<<< HEAD
  end
=======
>>>>>>> d1c4f0493ef854e8dc441b22806a3f7824775e8c


  private
  def registration_params
    params.require(:registration).permit(:registered)
  end

end
