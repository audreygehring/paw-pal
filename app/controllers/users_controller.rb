class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @sessions = @user.sessions
  end

  def new
  end
end
