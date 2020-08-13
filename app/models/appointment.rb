class Appointment < ApplicationRecord
  belongs_to :user

  # Appointment Type
  enum appointment_type: { beginning_workday: 0, lunch_time: 1, return_of_lunch: 2,  end_workday: 3 }
end