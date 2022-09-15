class EventsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    if user_signed_in?
      @attendance = current_user.attendances.find_by attended_event_id: params[:id]
    end
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :date, :location)
    end
end
