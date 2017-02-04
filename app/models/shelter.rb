class Shelter < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  def self.search(search)
    where("zip ILIKE :search", search: "%#{search}%")
  end
end
