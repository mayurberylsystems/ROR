class Doctors::AppointmentsController < Doctors::MainController
  
  def index
  	@appointment=Appointment.all
  end
  
  def new
  end

  def create
  	@appointment=Appointment.new(appointment_params)
   	@appointment.save
   	redirect_to doctors_appointments_path   	
  end
  
  private
  def appointment_params
    params.require(:appointment).permit(:name,:age,:address)
  end






end
