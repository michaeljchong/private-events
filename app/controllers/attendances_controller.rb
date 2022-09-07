class AttendancesController < ApplicationController
  def new
    @event = current_user.attended_events.build
  end

  def create
    @event = current_user.attended_events.build(attendance_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def attendance_params
    params.require(:attendance).permit(:attendee_id, :attended_event_id)
  end
end
