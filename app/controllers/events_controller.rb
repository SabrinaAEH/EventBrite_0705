class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event = current_user.events.build(event_params)
    @event.save
    if @event.save
      flash[:success] = "évènement créé avec succès !"
      redirect_to root_path
    else
      flash.now[:error] = "Une ou plusieurs erreurs ont été détectées : #{@event.errors.full_messages.join(" , ")}"
      redirect_to new_event_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :start_date, :duration, :title, :description, :price, :location)
  end

  end
