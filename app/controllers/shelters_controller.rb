class SheltersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @volunteer_sessions_initial = VolunteerSession.where(user: current_user)
    @upcoming_volunteer_sessions = @volunteer_sessions_initial.where('date >= ?', Date.today)
    @past_volunteer_sessions = @volunteer_sessions_initial.where('date <= ?', Date.today)
  end

  def show
    if params[:id].length > 5
      params_parse(params[:id])
    else
      @created_shelter = Shelter.find(params[:id])
      @volunteer_sessions = VolunteerSession.where(shelter: @created_shelter)
    end
  end
end
