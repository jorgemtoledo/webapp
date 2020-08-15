class Appointment < ApplicationRecord
  validates :appointment_type, :user_id, presence: true

  before_create :set_time

  belongs_to :user
  scope :registred_this_day, -> { where("DATE(appointment_date) = ?", Date.today) }
  scope :appointment_user_id, -> { where(user_id: current.id) }

  # Appointment Type
  enum appointment_type: { beginning_workday: 0, lunch_time: 1, return_of_lunch: 2,  end_workday: 3 }

  private
  def set_time
    self.appointment_date = Time.now
  end
end