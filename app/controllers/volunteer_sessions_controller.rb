class VolunteerSessionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @volunteer_session = VolunteerSession.new
    @shelter = Shelter.find(params[:shelter_id])
    @times = VolunteerSession::TIMES
  end

  def create
    @volunteer_session = VolunteerSession.find_or_create_by(volunteer_session_params)
    @shelter = Shelter.find(params[:shelter_id])
    @user = current_user
    binding.pry

    if @volunteer_session.save
      flash[:notice] = "Volunteer Session added successfully."
      redirect_to user_path(@user)
    end
  end

  private

  def volunteer_session_params
    params.require(:volunteer_session).permit(
      :user_id,
      :shelter_id,
      :date,
      :time
    ).merge(
      shelter: Shelter.find(params[:shelter_id]),
      user: current_user
    )
  end
end
