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
