class SheltersController < ApplicationController

  def index
    if params[:search]
      petfinder_key = ENV["PETFINDER_API_KEY"]
      uri = URI("http://api.petfinder.com/shelter.find?key=#{petfinder_key}&format=json&location=#{params[:search]}")

      response = Net::HTTP.get_response(uri)
      shelters_json = JSON.parse(response.body)

      @raw_shelters = shelters_json["petfinder"]["shelters"]["shelter"]

      if @shelters == nil
        flash[:notice] = "There are no shelters in that area."
      end
    end
  end

  def show
  end


end
