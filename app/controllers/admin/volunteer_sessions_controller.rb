class Admin::VolunteerSessionsController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  def index
    @volunteer_sessions = VolunteerSession.where('date >= ?', Date.today)
  end

  def destroy
    @volunteer_session = VolunteerSession.find(params[:id])

    @volunteer_session.destroy
    flash[:notice] = "Volunteer session deleted."
    redirect_to admin_volunteer_sessions_path
  end

  private

  def is_admin?
    if current_user.admin?
      true
    else
      flash[:notice] = "Sorry, you don't have access to that feature."
    end
  end
end
