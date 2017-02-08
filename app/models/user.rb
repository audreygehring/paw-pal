class User < ApplicationRecord
  attr_accessor :login

  has_many :sessions
  has_many :shelters, through: :sessions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :admin, inclusion: { in: [true, false] }
  validates :role, inclusion: { in: ["Volunteer", "Rescue Owner"] }

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  def make_admin!
    self.update_attribute(:admin, true)
  end
  def revoke_admin!
    self.update_attribute(:admin, false)
  end
end
