require 'rails_helper'

feature "user visit show page", %{
  As a registered  user
  I want to visit a shelter show page
  To learn more about the shelter
} do

  scenario 'user signs up for volunteer session' do
    user1 = User.create(first_name: "Sansa", last_name: "Stark", email: "sansa@stark.com", password: "password", password_confirmation: "password", favorite_animal: "Cat")
    shelter1 = Shelter.create(id: "TN305", name: "Direwolf Rescue", address: "1 Winterfell Way", city: "Winterfell", state: "The North", zip: "10203")

    visit new_user_session_path

    fill_in "Email", with: "sansa@stark.com"
    fill_in "Password", with: "password"
    click_button "Log In"

    scenario "visit show page" do
      visit `/shelters/#{shelter1.id}#{shelter1.zip}`

      expect(page).to have_content("Direwolf Rescue")
      expect(page).to have_content("Volunteer Here!")

      select('10 a.m. - 11 a.m.', :from => "time")

      expect(page).to have_content("New Volunteer Session Created!")
    end
  end
end
