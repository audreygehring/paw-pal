class SheltersController < ApplicationController

  def index
    if params[:search]
      @shelters = 
      if @shelters.empty?
        flash[:notice] = "There are no shelters in that area."
      end
    end
  end
end
