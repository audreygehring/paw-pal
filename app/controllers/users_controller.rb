class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @volunteer_sessions_initial = VolunteerSession.where(user: current_user)
    @upcoming_volunteer_sessions = @volunteer_sessions_initial.where('date >= ?', Date.today)
    @past_volunteer_sessions = @volunteer_sessions_initial.where('date <= ?', Date.today)
  end
end
