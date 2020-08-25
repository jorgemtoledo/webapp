class Appointment < ApplicationRecord
  validates :appointment_type, :user_id, presence: true

  before_create :set_time

  belongs_to :user
  scope :registred_this_day, -> { where("DATE(appointment_date) = ?", Date.today) }
  scope :appointment_user_id, -> { where(user_id: current.id) }

  # Appointment Type
  enum appointment_type: { Inicio: 0, Almoco: 1, Retorno: 2,  Saida: 3 }

  APPOINTMENTS = %w[Inicio Almoco Retorno Saida].freeze

  # APPOINTMENTS = %w[0 1 2 3].freeze
  # Appointment.where(user_id: 1).group_by { |c| c.created_at.to_date }
  # Appointment.where(user_id: 1).group_by(&:created_at)
  # appointment_type
  # [k, v.pluck(:appointment_type).map { |v2| v2}]

  # def self.report
  #   Appointment.where(user_id: 1).group_by { |c| c.created_at.to_date }.map do |k, v|
  #     [k, EVENTS.map { |event| v.pluck(:appointment_type).include?(event)}]
  #   end.to_h
  # end


  def self.report
    # ===> 1ª forma de fazer: map(...).to_h
    # Appointment.where(user_id: 1).group_by { |c| c.created_at.to_date }.map do |date, appointments|
    #   [date, APPOINTMENTS.map { |appointment| appointments.pluck(:appointment_type).include?(appointment)}]
    # end.to_h

    # ===> 2ª forma de fazer: reduce
    # Appointment.all.where(user_id: 1).group_by { |c| c.created_at.to_date }.reduce({}) do |hash, (date, appointments)|
    #   hash[date] = APPOINTMENTS.map { |appointment| appointments.pluck(:appointment_type).include?(appointment) }
    #   hash
    # end

    #  # ===> 3ª forma de fazer: each_with_object
    #  all.group_by(&:date).each_with_object({}) do |(date, activities), hash|
    #   hash[date] = EVENTS.map { |event| activities.pluck(:event).include?(event) }
    # end

    # ===> 3ª forma de fazer: each_with_object
    # Appointment.all.group_by { |c| c.appointment_date.to_date }.each_with_object({}) do |(date, appointments), hash|
    #   hash[date] = APPOINTMENTS.map { |appointment| appointments.pluck(:appointment_type).include?(appointment) }
    # end

    # ===> 4ª forma de fazer: group_by user_id and created_at
    # Appointment.all.group_by { |x| x[:user_id] }.transform_values do |v1|
    #   v1.group_by { |c| c.created_at.to_date }.map do |date, appointments|
    #     [date, APPOINTMENTS.map { |appointment| appointments.pluck(:appointment_type).include?(appointment)}]
    #   end.to_h
    # end

    # ===> 5ª forma de fazer: group_by created_at and user_id
    # Appointment.all.group_by { |c| c.created_at.to_date }.transform_values do |v1|
    #   v1.group_by { |x| x[:user_id] }.map do |user_id, appointments|
    #     [user_id, APPOINTMENTS.map { |appointment| appointments.pluck(:appointment_type).include?(appointment)}]
    #   end.to_h
    # end

    # ===> 6ª forma de fazer: group_by created_at and user_id
    # Appointment.all.group_by { |c| c.created_at.to_date }.map do |date, v1|
    #   v1.group_by { |x| x[:user_id] }.map do |user_id, appointments|
    #     [user_id, APPOINTMENTS.map { |appointment| appointments.pluck(:appointment_type).include?(appointment)}]
    #   end.to_h
    # end


    # Appointment.all.group_by { |c| c.created_at.to_date }.map do |date, v1|
    #   [date, v1.group_by { |x| x[:user_id] }.map do |user_id, appointments|
    #     [user_id, APPOINTMENTS.map { |appointment| appointments.pluck(:appointment_type).include?(appointment)}]
    #   end.to_h]
    # end    

    Appointment.all.group_by { |c| c.appointment_date.to_date }.map do |date, v1|
      [date, v1.group_by { |x| x[:user_id] }.map do |user_id, appointments|
        user = User.find(user_id)
        appointment_type = appointments.pluck(:appointment_type)
        appointment_date = appointments.pluck(:appointment_date)

        appointments_exists = APPOINTMENTS.map { |appointment| appointment}

        hrs_appt_1 = appointments_exists[1] == appointment_type[1] ? TimeDifference.between(appointment_date[0], appointment_date[1]).in_hours : ''
        hrs_appt_2 = appointments_exists[3] == appointment_type[3] ? TimeDifference.between(appointment_date[2], appointment_date[3]).in_hours : ''        

        list_appts = {
          appt_1: appointments_exists[0] == appointment_type[0] ? appointment_date[0].strftime("%I:%M%p") : '',
          appt_2: appointments_exists[1] == appointment_type[1] ? appointment_date[1].strftime("%I:%M%p") : '',
          appt_3: appointments_exists[2] == appointment_type[2] ? appointment_date[2].strftime("%I:%M%p") : '',
          appt_4: appointments_exists[3] == appointment_type[3] ? appointment_date[3].strftime("%I:%M%p") : '',
          total_hrs_apts: appointments_exists[3] == appointment_type[3] ? hrs_appt_1 + hrs_appt_2 : hrs_appt_1
        }
        [user, list_appts]
      end.to_h]
    end
  end

  private
  def set_time
    self.appointment_date = Time.now
  end
end