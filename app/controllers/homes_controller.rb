class HomesController < ApplicationController
  def index
    @shelters = Shelter.all
  end
end
