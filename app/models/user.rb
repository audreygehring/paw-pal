class User < ApplicationRecord
  validates :role, presence: true, inclusion: { in: ["Rescue Owner", "Volunteer"] }

  has_many :sessions
  has_many :volunteers, class_name: :User, through: :sessions

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable
end
