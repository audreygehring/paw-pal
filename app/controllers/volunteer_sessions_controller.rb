class VolunteerSessionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @volunteer_session = VolunteerSession.new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    @user = current_user
    @volunteer_session = VolunteerSession.new(volunteer_session_params)

    if @volunteer_session.save
      flash[:notice] = "Volunteer Session added successfully."
      redirect_to shelter_path(@shelter)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def volunteer_session_params
    params.require(:volunteer_session).permit(:user_id, :shelter_id, :date, :time)
  end
end
