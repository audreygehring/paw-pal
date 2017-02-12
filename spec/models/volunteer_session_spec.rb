require 'rails_helper'

RSpec.describe VolunteerSession, type: :model do
  it { should have_valid(:date).when("Fri., November 12", "Mon., January 11") }
  it { should_not have_valid(:date).when(nil, "") }

  it { should have_valid(:time).when("10 a.m. - 11 a.m.", "2 p.m. - 3 p.m.") }
  it { should_not have_valid(:time).when(nil, "") }

  it { should have_valid(:user_id).when("2", "3") }
  it { should_not have_valid(:user_id).when(nil, "") }

  it { should have_valid(:shelter_id).when("7", "8") }
  it { should_not have_valid(:shelter_id).when(nil, "") }

end
