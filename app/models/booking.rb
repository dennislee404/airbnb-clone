class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  after_create :calculate_duration
  after_create :calculate_price

  def calculate_duration
    self.duration = (check_in - check_out).to_i  
    self.save  
  end

  def calculate_price
    self.total_price = duration * listing.price
    self.save
  end
end
