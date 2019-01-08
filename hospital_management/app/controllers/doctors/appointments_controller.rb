class Doctors::AppointmentsController < Doctors::MainController
  
  def index
  	@appointments = current_doctor.appointments
  end
  
  def new
  end

  def create
    @appointment = current_doctor.appointments.new(appointment_params)
     if @appointment.save
      redirect_to doctors_appointments_path
    else
      render 'new'
      flash[:notice] = "Didn't work"
    end
  end

  def edit
    @appointment = current_doctor.appointments.find(params[:id])
  end

  def update
    debugger
    @appointment = current_doctor.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to doctors_appointments_path
    else
      render 'edit'
    end
  end

   def destroy
    appointment = current_doctor.appointments.find(params[:id])
    appointment.destroy
    redirect_to doctors_appointments_path
  end

  def show
    @appointment = current_doctor.appointments.find(params[:id])
  end


  private
  def appointment_params
    params.require(:appointment).permit(:doctor_id,:patient_id,:appoint_date)
  end

end
