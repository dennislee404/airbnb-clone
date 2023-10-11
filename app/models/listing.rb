class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy

  has_many_attached :photos

  PROPERTY_TYPES = %w[room house apartment]
end
