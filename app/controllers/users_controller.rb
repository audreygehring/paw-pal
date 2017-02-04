class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @volunteer_sessions = @user.volunteer_sessions
  end

  def new
  end
end
