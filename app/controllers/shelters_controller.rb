class SheltersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @volunteer_sessions = VolunteerSession.where(user: current_user)
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
