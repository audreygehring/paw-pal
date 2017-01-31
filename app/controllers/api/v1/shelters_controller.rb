require "net/http"
require "json"

class Api::V1::SheltersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    petfinder_key = ENV["PETFINDER_API_KEY"]
    uri = URI("http://api.petfinder.com/shelter.find?key=#{petfinder_key}&format=json&location=02125")

    response = Net::HTTP.get_response(uri)
    shelters_json = JSON.parse(response.body)

    raw_shelters = shelters_json["petfinder"]["shelters"]["shelter"]
  end

  def show
  end
end
