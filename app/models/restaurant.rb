class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo
end
