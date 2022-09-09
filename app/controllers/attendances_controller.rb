class AttendancesController < ApplicationController
  def new
    @event = current_user.attendances.build

  end

  def create
    @event = current_user.attendances.build(attendance_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def attendance_params
    params.require(:attendance).permit(:attendee_id, :attended_event_id)
  end
end
