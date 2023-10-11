class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  after_create :calculate_duration

  def calculate_duration
    self.duration = (check_in. - check_out).to_i    
  end
end
