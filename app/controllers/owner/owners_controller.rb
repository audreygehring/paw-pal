class RescueOwner::UsersController < ApplicationController

  def is_owner?
    if current_user.role == "Owner"
      true
    else
      flash[:notice] = "You don't have access to that feature."
  end
end
