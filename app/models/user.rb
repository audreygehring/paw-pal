class User < ApplicationRecord

  has_many :sessions
  has_many :volunteers, class_name: :User, through: :sessions

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable
end
