class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @volunteer_sessions = VolunteerSession.where(user: @user)
  end
end
