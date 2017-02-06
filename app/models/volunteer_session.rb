class VolunteerSession < ApplicationRecord
  TIMES = [
    ["10 a.m. - 11 a.m."],
    ["11 a.m. - 12 p.m."],
    ["12 p.m. - 1 p.m."],
    ["1 p.m. - 2 p.m."],
    ["2 p.m. - 3 p.m."],
    ["3 p.m. - 4 p.m."]
  ]

  belongs_to :shelter
  belongs_to :user

  validates :user_id, presence: true
  validates :time, presence: true
  validates :date, presence: true

end
