class Doctors::DoctorsController < ApplicationController

  def index
    @patients = current_doctor.patients
  end
  
  def after_sign_in_path(resource)
    doctors_doctors_path
  end

  def edit
    @patient = current_doctor.patient.find(params[:id])
  end

  def update
    @patient = current_doctor.patient.find(params[:id])
    if @patient.update(doctor_params)
      redirect_to doctors_doctors_path
    else
      render 'edit'
    end
  end

  def destroy
    @patients = current_doctor.patients.find(params[:id])
    @patients.destroy
    redirect_to doctors_doctors_path
 end

    private
    
    def doctor_params
      params.require(:doctor).permit(:first_name,:last_name,:contact,:address,:city,:state)
    end
end
