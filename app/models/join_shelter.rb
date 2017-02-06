class JoinShelter < ApplicationRecord
  validates :shelter_id, presence: true
  validates :key_zip, presence: true  
end
