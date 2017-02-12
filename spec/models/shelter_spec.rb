require 'rails_helper'

RSpec.describe Shelter, type: :model do
  it { should have_valid(:name).when("Animal Shelter", "Rescue League") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:city).when("Boston", "Madison") }
  it { should_not have_valid(:city).when(nil, "") }

  it { should have_valid(:state).when("MA", "WI") }
  it { should_not have_valid(:state).when(nil, "") }

  it { should have_valid(:zip).when("90210", "53711") }
  it { should_not have_valid(:zip).when(nil, "") }

end
