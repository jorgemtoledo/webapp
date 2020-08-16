class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    if current_user.admin?
      @appointments = Appointment.all
    else
      @appointments = Appointment.where(user_id: current_user.id)
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  def appointment_history
    @appointments = Appointment.where(user_id: params[:id])    
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @teste = Appointment.registred_this_day.where(user_id: current_user.id, appointment_type: appointment_params[:appointment_type])
    puts @teste.inspect
    if !Appointment.registred_this_day.where(user_id: current_user.id, appointment_type: appointment_params[:appointment_type]).blank?
      flash[:alert] = t('flash.actions.alert.appointment_exists')
      redirect_to new_appointment_path
      return      
    end
    
    @appointment = current_user.appointments.build(appointment_params)
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: t('flash.actions.notice.appointment_created')}
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    if !Appointment.registred_this_day.where(user_id: current_user.id, appointment_type: appointment_params[:appointment_type]).blank?
      flash[:alert] =  t('flash.actions.alert.appointment_exists')
      redirect_to '/appointments'
      return      
    end
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: t('flash.actions.notice.appointment_updated') }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: t('flash.actions.notice.appointment_destroyed')}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:appointment_date, :appointment_type, :user_id)
    end
end
