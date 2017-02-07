class SheltersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @volunteer_sessions_initial = VolunteerSession.where(user: current_user)
    @upcoming_volunteer_sessions = @volunteer_sessions_initial.where('date >= ?', Date.today)
    @past_volunteer_sessions = @volunteer_sessions_initial.where('date <= ?', Date.today)
  end

  def show
    id = params[:id].split('')
    zip_array = []

    5.times do
      zip_array << id.pop
    end

    @shelter_key = id.join('')
    @zip_code = zip_array.reverse.join('')

    if params[:id].length > 6 && Shelter.where(key: @shelter_key) == []
      params_parse(params[:id])
    else
      @created_shelter = Shelter.where(key: @shelter_key)
      @created_shelter = @created_shelter[0]
      @volunteer_sessions = VolunteerSession.where(shelter: @created_shelter)
    end
  end
end
