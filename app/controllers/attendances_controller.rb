class AttendancesController < ApplicationController
  def new
    @attending = current_user.attendances.build
  end

  def create
    @attending = current_user.attendances.build(attendance_params)

    if @attending.save
      redirect_to events_path(Event.find(params[:id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @attending = Attendance.find(params[:id])
    @attending.destroy

    redirect_to event_url
  end

  private
  def attendance_params
    params.require(:attendance).permit(:attendee_id, :attended_event_id)
  end
end
