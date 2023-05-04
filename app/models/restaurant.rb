class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reservations
  # has_many :reservations, dependent: :destroy
  has_one_attached :photo
end
