class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_shelter
    id = params[:id].split('')
    zip_array = []

    5.times do
      zip_array << id.pop
    end

    @shelter_key = id.join('')
    zip_code = zip_array.reverse.join('')

    @current_shelter = Shelter.where(key: @shelter_key)
  end

  def params_parse(params)

    petfinder_key = ENV["PETFINDER_API_KEY"]
    uri = URI("http://api.petfinder.com/shelter.get?key=#{petfinder_key}&format=json&location=#{@zip_code}&id=#{@shelter_key}")
    shelter_response = Net::HTTP.get_response(uri)
    shelter_info = JSON.parse(shelter_response.body)

    @shelter_show_data = shelter_info["petfinder"]["shelter"]

  @created_shelter = Shelter.find_or_create_by(
    name: @shelter_show_data["name"]["$t"],
    address: @shelter_show_data["address1"]["$t"],
    city: @shelter_show_data["city"]["$t"],
    state: @shelter_show_data["state"]["$t"],
    zip: @shelter_show_data["zip"]["$t"],
    key: @shelter_key,
    description: "",
    website: ""
  )
    @created_shelter.save

    @user = current_user
    @volunteer_sessions = VolunteerSession.where(shelter: @created_shelter)
    @volunteer_sessions = @volunteer_sessions.where('date >= ?', Date.today)
  end


  protected

  def after_sign_in_path_for(resource)
    shelters_path
  end

  def configure_permitted_parameters
    added_attrs = [
      :first_name,
      :last_name,
      :favorite_animal,
      :remember_me
    ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)

  end
end
