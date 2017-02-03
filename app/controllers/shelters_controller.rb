class SheltersController < ApplicationController
  def show
    id = params[:id].split('')
    zip_array = []

    5.times do
      zip_array << id.pop
    end

    shelter_id = id.join('')
    zip_code = zip_array.reverse.join('')

    petfinder_key = ENV["PETFINDER_API_KEY"]
    uri = URI("http://api.petfinder.com/shelter.get?key=#{petfinder_key}&format=json&location=#{zip_code}&id=#{shelter_id}")
    shelter_response = Net::HTTP.get_response(uri)
    shelter_info = JSON.parse(shelter_response.body)

    @shelter_show_data = shelter_info["petfinder"]["shelter"]



    @shelter = Shelter.find_or_create_by(name: @shelter_show_data["name"]["$t"],
                  address: @shelter_show_data["address1"]["$t"],
                  city: @shelter_show_data["city"]["$t"],
                  state: @shelter_show_data["state"]["$t"],
                  zip: @shelter_show_data["zip"]["$t"],
                  key: shelter_id)
    @shelter.save
      binding.pry
  end

  def index
  end

  def new
  end

  def create
  end
end
