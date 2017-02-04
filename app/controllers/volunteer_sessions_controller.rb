class VolunteerSessionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @volunteer_session = VolunteerSession.new
  end
  def create
    @user = current_user
    @volunteer_session = VolunteerSession.new(volunteer_session_params)
  end
  def edit
  end
  def update
  end
  def destroy

  end

  private

  def volunteer_session_params
    params.require(:volunteer_session).permit(:user_id, :shelter_id, :date, :time)
  end
end
