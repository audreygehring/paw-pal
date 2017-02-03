class SheltersController < ApplicationController
  def show
    id = params[:id].split('')
    zip = []

    5.times do
      zip << id.pop
    end

    shelter_id = id.join('')
    zip_code = zip.reverse.join('')

    petfinder_key = ENV["PETFINDER_API_KEY"]
    uri = URI("http://api.petfinder.com/shelter.get?key=#{petfinder_key}&format=json&location=#{zip_code}&id=#{shelter_id}")
    shelter_response = Net::HTTP.get_response(uri)
    shelter_info = JSON.parse(shelter_response.body)

    @shelter_show_data = shelter_info["petfinder"]["shelter"]
  end

  def index
  end

  def new
  end

  def create
  end
end
