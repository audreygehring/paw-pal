class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @volunteer_sessions_initial = VolunteerSession.where(user: current_user)
    @upcoming_volunteer_sessions = @volunteer_sessions_initial.where('date >= ?', Date.today)
    @past_volunteer_sessions = @volunteer_sessions_initial.where('date <= ?', Date.today)
  end

  def edit
    if current_user.role == "Rescue Owner" && current_user.shelter_id == nil
      shelter = Shelter.find(params[:shelter_id])
      current_user.update_attributes(shelter_id: shelter.id)
      shelter.update_attributes(user_id: current_user.id)
    end

    def update
      @user = current_user
      @shelter = @user.shelter
    end

  end
end
