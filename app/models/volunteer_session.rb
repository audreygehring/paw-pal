class VolunteerSession < ApplicationRecord
  belongs_to :shelter
  belongs_to :user

  validates :shelter_id, presence: true
  validates :user_id, presence: true
  validates :time, presence: true
  validates :date, presence: true
end
