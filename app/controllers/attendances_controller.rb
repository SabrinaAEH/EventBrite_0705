class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

    def index
        id = params[:event_id]
        @event = Event.find(id)
    end


  def new
    @attendance = Attendance.new
    # Assurez-vous que l'utilisateur n'est pas déjà participant ou administrateur de l'événement
    if current_user == @event.user || @event.participants.include?(current_user)
      flash[:error] = "Vous êtes déjà inscrit à cet événement."
      redirect_to @event
    end
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user = current_user
    @attendance.event = @event

    if @attendance.save
      flash[:success] = "Inscription réussie à l'événement !"
      redirect_to @event
    else
      flash[:error] = "Une erreur est survenue lors de l'inscription à l'événement."
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def attendance_params
    params.require(:attendance).permit(:stripe_customer_id)
  end
end
