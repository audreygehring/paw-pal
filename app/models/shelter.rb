class Shelter < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :key, presence: true, uniqueness: true

  def self.search(search)
    where("zip ILIKE :search", search: "%#{search}%")
  end
end
