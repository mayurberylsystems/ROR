class AppointmentsController < ApplicationController
	
	def index
		@appointment=Appointment.all
	end
	
	def new
    end

    def create
    	@appointment=Appointment.new(appointment_params)
    	@appointment.save
    	redirect_to appointment_path 
    end

    def edit
    	@Appointment = Appointment.find(params[:id])
    end

    def destroy
    	@appointment = Appointment.find(params[:id])
    	@appointment.destroy
    	redirect_to appointments_path
    end
    
    def update
    	@appointment = Appointment.find(params[:id])
    	if @appointment.update(Appointment_params)
    		redirect_to @appointment
    	else
    		render 'edit'
    	end
    end

    private
    
    def patient_params
    	params.require(:appointment).permit(:doctor_id,:patient_id)
    end
end
