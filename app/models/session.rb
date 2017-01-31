class Session < ApplicationRecord
  belongs_to :shelter
  belongs_to :volunteer, class_name: :User, foreign_key: :volunteer_id

  validates :shelter_id, presence: true
  validates :volunteer_id, presence: true
end
