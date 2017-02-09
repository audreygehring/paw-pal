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

    if @volunteer_session.save
      flash[:notice] = "Volunteer Session added successfully."
      redirect_to shelter_path(@shelter)
    end
  end

  def edit
    @volunteer_session = VolunteerSession.find(params[:id])
    @shelter = @volunteer_session.shelter
    @times = VolunteerSession::TIMES
  end

  def update
    @volunteer_session = VolunteerSession.find(params[:id])
    @shelter = @volunteer_session.shelter

    if @volunteer_session.update(volunteer_session_params)
      flash[:notice] = "Session updated successfully."
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @volunteer_session = VolunteerSession.find(params[:id])

    @volunteer_session.destroy
    flash[:notice] = "Volunteer session deleted!"
    redirect_to user_path(current_user)
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
