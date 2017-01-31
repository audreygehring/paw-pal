class Shelter < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :owner_id
  has_many :sessions
  has_many :volunteers, class_name: :User, through: :sessions

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
