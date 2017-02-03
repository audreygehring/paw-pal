class Api::V1::SheltersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    petfinder_key = ENV["PETFINDER_API_KEY"]
    uri = URI("http://api.petfinder.com/shelter.find?key=#{petfinder_key}&format=json&location=#{params[:id]}")

    response = Net::HTTP.get_response(uri)
    shelters_json = JSON.parse(response.body)

    @raw_shelters = shelters_json["petfinder"]["shelters"]["shelter"]
    @raw_shelters_hash = {shelters: @raw_shelters}
    render json: @raw_shelters_hash
  end

  def new

  end

  def create

  end
end
