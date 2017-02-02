class Volunteer::UsersController < ApplicationController

  def is_volunteer?
    if current_user.role == "Volunteer"
      true
    else
      flash[:notice] = "You don't have access to that feature."
  end
end
